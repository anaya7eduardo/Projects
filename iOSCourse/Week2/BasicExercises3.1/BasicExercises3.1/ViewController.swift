//
//  ViewController.swift
//  BasicExercises3.1
//
//  Created by Eduardo Anaya on 11/23/21.
//

import UIKit

let requestedComponents: Set<Calendar.Component> = [ .year, .month, .day ]

let dateTimeComponents = Calendar.current.dateComponents(requestedComponents, from: Date())

class ViewController: UIViewController {

    let frame = CGRect(x: 0, y: 0, width: 200, height: 21)
    lazy var label = UILabel(frame: frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        displayLabel()
        displayDate()
        createMultipleLabels()
    }
 
    func displayLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.backgroundColor = UIColor.white
        label.font = UIFont(name:"Verdana", size: 18.0)
        label.textColor = UIColor.red
        label.shadowColor = UIColor.gray
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.textAlignment = NSTextAlignment.center
        
        label.isUserInteractionEnabled = true
        
    }
    
    func displayDate() {
        label.text = String(dateTimeComponents.month!) + "/" + String(dateTimeComponents.day!) + "/" + String(dateTimeComponents.year!)
    }
    
    func createMultipleLabels() {
        for i in 0..<5 {
            print("T",i)
            let label = UILabel(frame: CGRect(x: 50, y: 20*i+385, width: 200, height: 21))
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.center
            let rCount = i + 1
            label.text = "Test Label: \(rCount)"
            self.view.addSubview(label)
            
            label.isUserInteractionEnabled = true
        }
    }


}
