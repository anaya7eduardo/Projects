//
//  ViewController.swift
//  MondayUserDefaults
//
//  Created by Eduardo Anaya on 12/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordLabel.isSecureTextEntry = true
        if UserDefaults.standard.bool(forKey: "UseLoggedIn") == true {
            navigationHome()
        }
    }

    @IBAction func loginTapped(_ sender: Any) {
        if usernameLabel.text == "admin" && passwordLabel.text == "password" {
            UserDefaults.standard.set(true, forKey: "UserLoggedIn")
            navigationHome()
        }
    }
    
    private func navigationHome() {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

