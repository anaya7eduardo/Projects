//
//  SecondViewController.swift
//  MondayUserDefaults
//
//  Created by Eduardo Anaya on 12/6/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "UserLoggedIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
