//
//  ViewControllerA.swift
//  BasicExercices4.1_2
//
//  Created by Eduardo Anaya on 11/24/21.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonTap(_ sender: Any) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "mainViewController2") as! ViewControllerB
            
            vc.passText = "Hello World"
                
                present(vc, animated: true, completion: nil)
    }

}
