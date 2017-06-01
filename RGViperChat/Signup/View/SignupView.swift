//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift

class SignupView: UIViewController, SignupViewProtocol {
    var presenter: SignupPresenterProtocol?

    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonSignup.layer.cornerRadius = 5.0

        buttonClose.tintColor = UIColor.white
        buttonClose.setTitleColor(UIColor.white, for: .normal)
        buttonClose.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        buttonClose.setTitle(String.fontAwesomeIcon(name: .times), for: .normal)

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

        let textFieldNameLeftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textFieldNameLeftView.backgroundColor = UIColor.clear
        textFieldNameLeftView.image = UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.white, size: CGSize(width: 15.0, height: 15.0))
        textFieldName.leftView = textFieldNameLeftView
        textFieldName.leftViewMode = .always
    }

    @IBAction func buttonCloseTapped(_ sender: Any) {
        presenter?.buttonCloseTapped()
    }

    @IBAction func buttonSignupTapped(_ sender: Any) {
        guard let name = textFieldName.text, let email = textFieldEmail.text, let password = textFieldPassword.text else {
            return
        }

        presenter?.signupButtonTapped(withUsername: name, email: email, password: password)
    }
}
