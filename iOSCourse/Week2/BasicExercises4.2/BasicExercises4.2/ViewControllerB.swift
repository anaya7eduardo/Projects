//
//  ViewControllerB.swift
//  BasicExercises4.2
//
//  Created by Eduardo Anaya on 11/24/21.
//

import UIKit

class ViewControllerB: UIViewController {
    
    var passTextSegue:String = ""
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel?.text = passTextSegue
    }


}
