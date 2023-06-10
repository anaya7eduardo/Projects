//
//  ViewController.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/14/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }

    @IBAction func logIn(_ sender: Any) {
        guard let userId = emailId.text else { return }
        guard let pass = password.text else { return }
        
        if (userId.isEmpty && pass.isEmpty) {
            emailId.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            password.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            alertNotification("Missing User and Password")
        } else if (!userId.isEmpty && pass.isEmpty) {
            emailId.backgroundColor = UIColor.white.withAlphaComponent(1.0)
            password.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            alertNotification("Missing Password")
        } else if (userId.isEmpty && !pass.isEmpty) {
            emailId.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            password.backgroundColor = UIColor.white.withAlphaComponent(1.0)
            alertNotification("Missing User")
        } else {
            emailId.backgroundColor = UIColor.white.withAlphaComponent(1.0)
            password.backgroundColor = UIColor.white.withAlphaComponent(1.0)
            emailId.text = ""
            password.text = ""
            
            print("User: \(userId) \nPassword: \(pass)")
            
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let detailsVC = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
//            detailsVC.name = "Welcome \(userId)"
//            let detailsVC = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
//            self.navigationController?.pushViewController(detailsVC, animated: true)
            mainCoordinator?.navigateToListViewController()
        }
    }
    
    func initialUISetup() {
        welcomeLabel.textAlignment = NSTextAlignment.center
        welcomeLabel.text = "WELCOME"
        welcomeLabel.font = UIFont(name:"ArialRoundedMTBold", size: 28.0)
        welcomeLabel.textColor = UIColor.brown
        
        loginButton.setTitle("Log In", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDissapear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    func alertNotification(_ title: String) -> () {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action)
        }
        alert.addAction(okAction)
        return present(alert, animated: true, completion: nil)
    }
}

extension UIColor {
    /// Returns customColor with 1.0 alpha
    static var customColor: UIColor {
        return UIColor(
            red:CGFloat.random(in: 0..<1),
            green:CGFloat.random(in: 0..<1),
            blue:CGFloat.random(in: 0..<1),
            alpha:1.0)
    }
    
    /// Returns customColor with 0.3 alpha
    static var customColor03: UIColor {
        return UIColor(
            red:CGFloat.random(in: 0..<1),
            green:CGFloat.random(in: 0..<1),
            blue:CGFloat.random(in: 0..<1),
            alpha:0.3)
    }
}

/*
 ViewController Life Cycle Methods:
 1. init
 2. loadView
 3. viewDidLoad
 4. viewWillAppear
 5. viewDidAppear
 6. viewWillDisappear
 7. viewDidDisappear
 */

// MVVM-C / Coordinator Pattern
// Model-View-ViewModel-Coordinator
// All navigation will be programmatically
