//
//  ViewController.swift
//  Test1
//
//  Created by Eduardo Anaya on 11/18/21.
//

import UIKit

class ViewController: UIViewController {

    var segue: String = "mySegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func next1(_ sender: Any) {
        performSegue(withIdentifier: segue, sender: nil)
        print("Hello Button 1")
    }
    
}

