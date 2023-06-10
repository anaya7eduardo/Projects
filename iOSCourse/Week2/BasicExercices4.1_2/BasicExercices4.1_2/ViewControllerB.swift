//
//  ViewControllerB.swift
//  BasicExercices4.1_2
//
//  Created by Eduardo Anaya on 11/24/21.
//

import UIKit

class ViewControllerB: UIViewController {

    var passText : String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel?.text = passText
        // Do any additional setup after loading the view.
    }

}
