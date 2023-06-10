//
//  ViewController.swift
//  BasicExercises4.2
//
//  Created by Eduardo Anaya on 11/24/21.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestination = segue.destination as! ViewControllerB
        segueDestination.passTextSegue = "Hello World!"
    }
    
}
