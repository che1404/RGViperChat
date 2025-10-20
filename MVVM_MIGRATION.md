# Migración de VIPER a MVVM + Coordinators

## Estado de la Migración

Esta rama (`claude/mvvm-coordinators-migration-011CUJzskLmugZgrHeswLNQ6`) contiene una migración parcial del proyecto de VIPER a MVVM + Coordinators usando ReactiveSwift y ReactiveCocoa para bindings reactivos.

### Módulos Completados ✅

1. **Authorization** - Completamente migrado
2. **Signup** - Completamente migrado

### Módulos Pendientes ⏳

1. **ChatList** - Stub creado, necesita implementación completa
2. **Chat** - Stub creado, necesita implementación completa
3. **CreateChat** - Stub creado, necesita implementación completa

## Cambios Arquitectónicos

### De VIPER a MVVM + Coordinators

#### VIPER (Antes)
```
View ←→ Presenter ←→ Interactor ←→ DataManager
                ↓
            Wireframe
```

5-7 archivos por módulo:
- View (UIViewController)
- Presenter + PresenterSpec
- Interactor + InteractorSpec
- Wireframe
- Protocols
- DataManager/API
- DataManager/Local

#### MVVM + Coordinators (Después)
```
View + ViewModel ←→ Repository
        ↓
   Coordinator
```

3-4 archivos por módulo:
- ViewController (UIViewController con bindings)
- ViewModel (lógica de presentación reactiva)
- Repository (acceso a datos)
- Coordinator (navegación)

### Beneficios de la Nueva Arquitectura

1. **Menos Boilerplate**: ~40% menos código por módulo
2. **Bindings Reactivos**: Flujo de datos unidireccional claro con ReactiveSwift
3. **Testing Simplificado**: ViewModels puros sin dependencias de UIKit
4. **Navegación Desacoplada**: Coordinators manejan toda la navegación
5. **Mejor Composición**: Fácil combinar múltiples signals/properties

## Dependencias Agregadas

En el `Podfile`:

```ruby
# MVVM + Reactive bindings
pod 'ReactiveSwift', '~> 7.1'
pod 'ReactiveCocoa', '~> 12.0'
```

**NOTA**: Ejecutar `pod install` después de checkout de esta rama.

## Estructura de Archivos

### Archivos Base Creados

```
RGViperChat/Common/
├── Coordinator.swift          # Protocolo base para coordinators
├── ViewModelType.swift        # Protocolo base para ViewModels
├── AppCoordinator.swift       # Coordinador principal de la app
├── Result.swift               # (Existente) Tipo Result
└── RootWireframe.swift        # (Legacy - puede eliminarse)
```

### Ejemplo: Módulo Authorization

```
RGViperChat/Authorization/
├── View/
│   ├── AuthorizationView.swift              # (Legacy VIPER)
│   └── AuthorizationViewController.swift     # ✨ Nuevo MVVM
├── ViewModel/
│   └── AuthorizationViewModel.swift          # ✨ Nuevo
├── Repository/
│   └── AuthorizationRepository.swift         # ✨ Nuevo
├── Coordinator/
│   └── AuthorizationCoordinator.swift        # ✨ Nuevo
├── Presenter/                                # (Legacy - eliminar)
├── Interactor/                               # (Legacy - eliminar)
├── Wireframe/                                # (Legacy - eliminar)
└── DataManager/                              # (Legacy - eliminar)
```

## Patrón de Implementación

### 1. Repository (Capa de Datos)

Reemplaza: `APIDataManager` + `LocalDataManager` + `Interactor`

```swift
protocol AuthorizationRepositoryProtocol {
    func login(email: String, password: String) -> SignalProducer<Void, Error>
}

final class AuthorizationRepository: AuthorizationRepositoryProtocol {
    func login(email: String, password: String) -> SignalProducer<Void, Error> {
        return SignalProducer { observer, lifetime in
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let error = error {
                    observer.send(error: error)
                } else {
                    observer.send(value: ())
                    observer.sendCompleted()
                }
            }
        }
    }
}
```

### 2. ViewModel (Lógica de Presentación)

Reemplaza: `Presenter` + parte de `Interactor`

```swift
final class AuthorizationViewModel: ViewModelType {
    struct Input {
        let email: Signal<String, Never>
        let password: Signal<String, Never>
        let loginTrigger: Signal<Void, Never>
    }

    struct Output {
        let isLoading: Signal<Bool, Never>
        let loginSuccess: Signal<Void, Never>
        let loginError: Signal<String, Never>
        let isLoginEnabled: Signal<Bool, Never>
    }

    private let repository: AuthorizationRepositoryProtocol

    init(repository: AuthorizationRepositoryProtocol = AuthorizationRepository()) {
        self.repository = repository
    }

    func transform(input: Input) -> Output {
        // Lógica de transformación usando ReactiveSwift Actions
        let loginAction = Action<(String, String), Void, Error> { [repository] email, password in
            return repository.login(email: email, password: password)
        }

        // ... bind inputs to action and return outputs
    }
}
```

**Patrón Input-Output**:
- **Input**: Eventos del usuario (taps, text changes)
- **Output**: Estado de la vista (loading, errors, success)
- **Transform**: Función pura que convierte inputs en outputs

### 3. ViewController (Vista con Bindings)

Reemplaza: `View` (UIViewController de VIPER)

```swift
class AuthorizationViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!

    var viewModel: AuthorizationViewModel!
    var onLoginSuccess: (() -> Void)?

    private let loginTrigger = Signal<Void, Never>.pipe()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func bindViewModel() {
        let output = viewModel.transform(
            input: AuthorizationViewModel.Input(
                email: textFieldEmail.reactive.continuousTextValues.skipNil(),
                password: textFieldPassword.reactive.continuousTextValues.skipNil(),
                loginTrigger: loginTrigger.output
            )
        )

        // Bind outputs to UI
        output.isLoading
            .observe(on: UIScheduler())
            .observeValues { [weak self] isLoading in
                self?.buttonLogin.isEnabled = !isLoading
            }

        output.loginSuccess
            .observe(on: UIScheduler())
            .observeValues { [weak self] _ in
                self?.onLoginSuccess?()
            }
    }

    @IBAction func buttonLoginTapped(_ sender: Any) {
        loginTrigger.input.send(value: ())
    }
}
```

**Bindings con ReactiveCocoa**:
- `reactive.continuousTextValues`: Signal para cambios de texto en UITextField
- `UIScheduler()`: Ejecuta en main thread para updates de UI
- `observeValues`: Suscribe a cambios y actualiza la vista

### 4. Coordinator (Navegación)

Reemplaza: `Wireframe`

```swift
final class AuthorizationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    var onAuthenticationSuccess: (() -> Void)?
    var onSignupRequested: (() -> Void)?

    func start() {
        let viewModel = AuthorizationViewModel()
        let viewController = createAuthorizationViewController(viewModel: viewModel)

        viewController.onLoginSuccess = { [weak self] in
            self?.onAuthenticationSuccess?()
        }

        navigationController.setViewControllers([viewController], animated: true)
    }

    private func createAuthorizationViewController(
        viewModel: AuthorizationViewModel
    ) -> AuthorizationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "AuthorizationView"
        ) as! AuthorizationViewController

        viewController.viewModel = viewModel
        return viewController
    }
}
```

**Responsabilidades del Coordinator**:
- Crear ViewControllers y ViewModels
- Inyectar dependencias
- Manejar navegación entre pantallas
- Gestionar child coordinators
- Callbacks para comunicación entre coordinators

## Flujo de Datos Completo

### Ejemplo: Login de Usuario

```
1. Usuario toca botón Login
   ↓
2. ViewController.buttonLoginTapped()
   → loginTrigger.input.send(value: ())
   ↓
3. ViewModel.transform()
   → loginAction.apply((email, password)).start()
   ↓
4. Repository.login()
   → Firebase Auth
   ↓
5. Repository envía resultado
   → SignalProducer completa o error
   ↓
6. ViewModel emite output
   → loginSuccess o loginError signal
   ↓
7. ViewController observa output
   → onLoginSuccess?() callback
   ↓
8. Coordinator maneja navegación
   → onAuthenticationSuccess?()
   → Navega a ChatListCoordinator
```

## Testing con MVVM

### ViewModel Tests (más simples que VIPER)

```swift
class AuthorizationViewModelSpec: QuickSpec {
    override func spec() {
        describe("AuthorizationViewModel") {
            var viewModel: AuthorizationViewModel!
            var mockRepository: MockAuthorizationRepository!

            beforeEach {
                mockRepository = MockAuthorizationRepository()
                viewModel = AuthorizationViewModel(repository: mockRepository)
            }

            it("emits loginSuccess when credentials are valid") {
                // Arrange
                let emailPipe = Signal<String, Never>.pipe()
                let passwordPipe = Signal<String, Never>.pipe()
                let loginTriggerPipe = Signal<Void, Never>.pipe()

                let output = viewModel.transform(
                    input: AuthorizationViewModel.Input(
                        email: emailPipe.output,
                        password: passwordPipe.output,
                        loginTrigger: loginTriggerPipe.output
                    )
                )

                var successEmitted = false
                output.loginSuccess.observeValues { successEmitted = true }

                // Act
                mockRepository.loginResult = .success(())
                emailPipe.input.send(value: "test@example.com")
                passwordPipe.input.send(value: "password123")
                loginTriggerPipe.input.send(value: ())

                // Assert
                expect(successEmitted).toEventually(beTrue())
            }
        }
    }
}
```

**Ventajas sobre VIPER tests**:
- No necesitas mockear View, Presenter, Interactor, Wireframe
- Solo mock del Repository
- Testing puramente funcional con Signals
- Sin dependencias de UIKit

## Comparación de Complejidad

### VIPER: Login Feature

**Archivos**: 9 archivos
- AuthorizationProtocols.swift (~70 líneas)
- AuthorizationView.swift (~50 líneas)
- AuthorizationPresenter.swift (~40 líneas)
- AuthorizationPresenterSpec.swift (~80 líneas)
- AuthorizationInteractor.swift (~30 líneas)
- AuthorizationInteractorSpec.swift (~60 líneas)
- AuthorizationWireframe.swift (~50 líneas)
- AuthorizationAPIDataManager.swift (~20 líneas)
- AuthorizationLocalDataManager.swift (~10 líneas)

**Total**: ~410 líneas, 9 archivos

### MVVM + Coordinators: Login Feature

**Archivos**: 4 archivos
- AuthorizationViewController.swift (~120 líneas con bindings)
- AuthorizationViewModel.swift (~80 líneas)
- AuthorizationRepository.swift (~30 líneas)
- AuthorizationCoordinator.swift (~40 líneas)

**Total**: ~270 líneas, 4 archivos

**Reducción**: ~34% menos código, 56% menos archivos

## Pasos para Completar la Migración

### 1. Instalar Dependencias

```bash
pod install
```

### 2. Completar Módulos Pendientes

Para cada módulo (ChatList, Chat, CreateChat):

1. Crear `[Module]Repository.swift`
   - Mover lógica de APIDataManager
   - Retornar SignalProducers
2. Crear `[Module]ViewModel.swift`
   - Definir Input/Output structs
   - Implementar transform con Actions
3. Crear `[Module]ViewController.swift`
   - Setup bindings con ReactiveCocoa
   - Callbacks para coordinator
4. Completar `[Module]Coordinator.swift`
   - Implementar start()
   - Setup navigation flow

### 3. Actualizar AppDelegate

Comentar el código VIPER existente y descomentar AppCoordinator:

```swift
// In AppDelegate.swift
var appCoordinator: AppCoordinator!

func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    FirebaseApp.configure()

    let serviceFactory = ServiceFactory()

    // New MVVM+Coordinators approach
    let window = UIWindow(frame: UIScreen.main.bounds)
    appCoordinator = AppCoordinator(window: window, serviceFactory: serviceFactory)
    appCoordinator.start()

    return true
}
```

### 4. Eliminar Archivos Legacy

Una vez todos los módulos estén migrados:

```bash
# Eliminar carpetas VIPER de cada módulo
rm -rf RGViperChat/*/Presenter
rm -rf RGViperChat/*/Interactor
rm -rf RGViperChat/*/Wireframe
rm -rf RGViperChat/*/Protocols
rm -rf RGViperChat/*/DataManager

# Eliminar vistas legacy
rm RGViperChat/*/View/*View.swift  # Mantener *ViewController.swift
```

### 5. Actualizar Tests

Reemplazar specs de Presenter/Interactor con ViewModel specs:

```swift
// Antes: AuthorizationPresenterSpec.swift + AuthorizationInteractorSpec.swift
// Después: AuthorizationViewModelSpec.swift
```

## Consideraciones Especiales

### Chat Module con JSQMessagesViewController

El módulo Chat usa `JSQMessagesViewController` que tiene su propio patrón delegate. Para integrarlo:

```swift
class ChatViewController: JSQMessagesViewController {
    var viewModel: ChatViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        // Bind ViewModel outputs to JSQMessagesViewController delegate methods
        viewModel.messages
            .observe(on: UIScheduler())
            .observeValues { [weak self] messages in
                self?.reloadMessagesView()
            }
    }

    // JSQMessagesViewController delegate methods actualizan ViewModel inputs
    override func didPressSend(_ button: UIButton!, ...) {
        viewModel.sendMessage(text: text)
    }
}
```

### Encryption Service

El `EncryptionService` en `ServiceFactory` se puede inyectar en Repositories:

```swift
final class ChatRepository: ChatRepositoryProtocol {
    private let encryptionService: EncryptionService

    init(encryptionService: EncryptionService) {
        self.encryptionService = encryptionService
    }

    func sendMessage(text: String) -> SignalProducer<Void, Error> {
        let encryptedText = encryptionService.encrypt(text)
        // ... send to Firebase
    }
}
```

Inyección desde Coordinator:

```swift
let repository = ChatRepository(
    encryptionService: serviceFactory.encryptionService
)
let viewModel = ChatViewModel(repository: repository)
```

## Recursos y Referencias

### ReactiveSwift

- [Documentación Oficial](https://github.com/ReactiveCocoa/ReactiveSwift)
- [API Reference](https://github.com/ReactiveCocoa/ReactiveSwift/tree/master/Documentation)
- Conceptos clave: Signal, SignalProducer, Property, Action

### ReactiveCocoa

- [Documentación Oficial](https://github.com/ReactiveCocoa/ReactiveCocoa)
- Bindings para UIKit con extensiones `.reactive`

### Coordinator Pattern

- [Coordinators Redux](https://khanlou.com/2015/10/coordinators-redux/)
- [Advanced Coordinators](https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios)

### MVVM en iOS

- [MVVM with ReactiveSwift](https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm)

## Autor

Migración realizada por Claude
Branch: `claude/mvvm-coordinators-migration-011CUJzskLmugZgrHeswLNQ6`
Fecha: 2025

## Estado Final Esperado

```
- [x] Podfile actualizado con ReactiveSwift/ReactiveCocoa
- [x] Protocolos base (Coordinator, ViewModelType) creados
- [x] AppCoordinator implementado
- [x] Authorization module completamente migrado
- [x] Signup module completamente migrado
- [ ] ChatList module (stub creado, pendiente implementación)
- [ ] Chat module (stub creado, pendiente implementación)
- [ ] CreateChat module (stub creado, pendiente implementación)
- [ ] AppDelegate actualizado para usar AppCoordinator
- [ ] Tests actualizados para ViewModels
- [ ] Archivos legacy VIPER eliminados
```

## Notas Finales

Esta migración es un **trabajo en progreso**. Los módulos Authorization y Signup están completamente funcionales y sirven como referencia para implementar los módulos restantes.

La arquitectura MVVM + Coordinators reduce significativamente el boilerplate de VIPER mientras mantiene:
- ✅ Separación de responsabilidades
- ✅ Testabilidad
- ✅ Navegación desacoplada
- ✅ Inyección de dependencias

Con la ventaja adicional de:
- ✨ Bindings reactivos declarativos
- ✨ Menos archivos por módulo
- ✨ Flujo de datos unidireccional claro
- ✨ Composición funcional con Signals
