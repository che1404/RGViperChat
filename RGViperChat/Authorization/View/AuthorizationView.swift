//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift

class AuthorizationView: UIViewController, AuthorizationViewProtocol {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!

    var presenter: AuthorizationPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonLogin.layer.cornerRadius = 5

        buttonSignup.layer.cornerRadius = 5

        let textFieldUsernameLeftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textFieldUsernameLeftView.backgroundColor = UIColor.clear
        textFieldUsernameLeftView.image = UIImage.fontAwesomeIcon(name: .envelope, textColor: UIColor.white, size: CGSize(width: 15.0, height: 15.0))
        textFieldEmail.leftView = textFieldUsernameLeftView
        textFieldEmail.leftViewMode = .always

        let textFieldPasswordLeftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textFieldPasswordLeftView.backgroundColor = UIColor.clear
        textFieldPasswordLeftView.image = UIImage.fontAwesomeIcon(name: .lock, textColor: UIColor.white, size: CGSize(width: 15.0, height: 15.0))
        textFieldPassword.leftView = textFieldPasswordLeftView
        textFieldPassword.leftViewMode = .always
    }

    @IBAction func buttonSignupTapped(_ sender: Any) {
        presenter?.buttonSignupTapped()
    }

    @IBAction func buttonLoginTapped(_ sender: Any) {
        guard let email = textFieldEmail.text, let password = textFieldPassword.text else {
            return
        }
        presenter?.buttonLoginTapped(withEmail: email, andPassword: password)
    }
}
