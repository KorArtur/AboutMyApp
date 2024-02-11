//
//  LoginViewController.swift
//  AboutMyApp
//
//  Created by Карина Короткая on 10.02.2024.
//

import UIKit

enum AlertType {
    case forgetLogin
    case forgetPassword
    case wrongLoginOrPass
}

struct User {
    let login: String
    let password: String
}

final class LoginViewController: UIViewController {
    
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
    private let currentUser = User(login: "user", password: "12345")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.currentUser = currentUser
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if loginTextField.text == currentUser.login,
           passwordTextField.text == currentUser.password {
            return true
        }
        presentAlert(for: .wrongLoginOrPass)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction private func forgetNameButtonTapped() {
        presentAlert(for: .forgetLogin)
    }
    
    @IBAction private func forgetPasswordButtonTapped() {
        presentAlert(for: .forgetPassword)
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func presentAlert(for type: AlertType) {
        var title = "✅"
        var message = ""
        
        switch type {
        case .forgetLogin:
            message = "Correct login is: \(currentUser.login)"
        case .forgetPassword:
            message = "Correct Password is: \(currentUser.password)"
        case .wrongLoginOrPass:
            title = "OOOPS❗️"
            message = "Wrong login or password"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) { _ in
            self.okAlertAction(for: type)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func okAlertAction(for type: AlertType) {
        if type == .wrongLoginOrPass {
            passwordTextField.text = ""
        } else if type == .forgetLogin {
            loginTextField.text = currentUser.login
        } else {
            passwordTextField.text = currentUser.password
        }
    }
}

