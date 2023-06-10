//
//  LoginViewController.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
//    private let viewModel = LoginViewModel()
    var viewModel: LoginViewModel! = nil
    
    func setup(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    private var cancelBag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLocalLanguage()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let userName = userNameTf.text , let password = passwordTf.text else {
            showLoginErrorAlert()
            return
        }
        
        let isValidLogin = viewModel.login(userName: userName, password: password)
        
        if isValidLogin {
            userNameTf.text = ""
            passwordTf.text = ""
            performSegue(withIdentifier:"tabBarNavigationSegue", sender: nil)
        } else {
            showLoginErrorAlert()
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "registrationSegue", sender: nil)
    }
    
    private func showLoginErrorAlert() {
        let alertController = UIAlertController(title:"Alert".localized(), message: "Login Failed! Try Again".localized(), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .destructive)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    private func setupLocalLanguage() {
        self.title = "Login".localized()
        userNameTf.placeholder = "Email".localized()
        passwordTf.placeholder = "Password".localized()
        loginButton.setTitle("Login".localized(), for: .normal)
        registerButton.setTitle("Register".localized(), for: .normal)
    }
    
}
