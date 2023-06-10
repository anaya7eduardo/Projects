//
//  SecondViewController.swift
//  Test1
//
//  Created by Eduardo Anaya on 11/18/21.
//

import UIKit

class SecondViewController: UIViewController {

    var segue2: String = "mySegue2"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func next2(_ sender: Any) {
        performSegue(withIdentifier: segue2, sender: nil)
        print("Hello Button 2")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
