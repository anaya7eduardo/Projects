//
//  RegisterViewController.swift
//  AstroPay
//
//  Created by Eduardo on 2/24/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameRegisterTf: UITextField!
    @IBOutlet weak var lastNameRegisterTf: UITextField!
    @IBOutlet weak var emailRegisterTf: UITextField!
    @IBOutlet weak var passwordRegisterTf: UITextField!
    @IBOutlet weak var userRegisterBtn: UIButton!
    
    private let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupLocalLanguage()
    }

    @IBAction func userRegistrationButtonAction(_ sender: Any) {
        guard let firstName = firstNameRegisterTf.text else {
            showRegistrationMissingInfoAlert("Missing First Name, Try Again".localized())
            return
        }
        
        guard let lastName = lastNameRegisterTf.text else {
            showRegistrationMissingInfoAlert("Missing Last Name, Try Again".localized())
            return
        }
        
        guard let emailAddrss = emailRegisterTf.text else {
            showRegistrationMissingInfoAlert("Missing Email, Try Again".localized())
            return
        }
        
        guard let passWord = passwordRegisterTf.text else {
            showRegistrationMissingInfoAlert("Missing Password, Try Again".localized())
            return
        }
        
        let isValidRegistration = registerViewModel.register(firstName: firstName, lastName: lastName, userName: emailAddrss, password: passWord)
        
        if isValidRegistration {
            // Store Name and Email in CoreData
            
            // Keep Password Secret in KeyChain
            
            showRegistrationSuccessAlert()
        } else {
            showRegistrationErrorAlert()
        }
        
    }
    
    private func showRegistrationMissingInfoAlert(_ msg: String) {
        let alertController = UIAlertController(title:"Alert".localized(), message: "\(msg)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .destructive)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    private func showRegistrationErrorAlert() {
        let alertController = UIAlertController(title:"Alert".localized(), message: "Verify Information!".localized(), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized(), style: .destructive)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    private func showRegistrationSuccessAlert() {
        let alertController = UIAlertController(title: "Success".localized(), message: "User Registered!".localized(), preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok".localized(), style: .default, handler: { (actin) in
            alertController.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func setupLocalLanguage() {
        self.title = "Register".localized()
        firstNameRegisterTf.placeholder = "First Name".localized()
        lastNameRegisterTf.placeholder = "Last Name".localized()
        emailRegisterTf.placeholder = "Email".localized()
        passwordRegisterTf.placeholder = "Password".localized()
        userRegisterBtn.setTitle("Register".localized(), for: .normal)
    }
    
}
