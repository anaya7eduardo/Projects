//
//  ViewController.swift
//  BasicExercises5.1
//
//  Created by Eduardo Anaya on 11/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petLegs: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .lightGray
        
            let pet = Dog()
            pet.name = "Firulais"
            pet.legs = 4
                
            petName.text = pet.name!
            petLegs.text = "\(pet.legs!)"
    }


}

