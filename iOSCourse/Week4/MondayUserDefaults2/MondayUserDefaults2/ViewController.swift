//
//  ViewController.swift
//  MondayUserDefaults2
//
//  Created by Eduardo Anaya on 12/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switchView: UISwitch!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var stringLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let isOn = UserDefaults.standard.bool(forKey: "switchIsOn")
        let isOn = UserDefaults.standard.switchIsOn
        _ = UserDefaults.standard.integer(forKey: "number")
        _ = UserDefaults.standard.string(forKey: "string")
        updateUI(isOn: isOn)
//        var user = User(firstName: "Loki", lastName: "Laufyson")
//        UserDefaults.standard.signedInUser = user
        var user = UserDefaultsManager.shared.signedInUser
        print("The signed in user is: \(String(describing: UserDefaultsManager.shared.signedInUser))")
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        updateUI(isOn: sender.isOn)
        UserDefaults.standard.switchIsOn = sender.isOn
//        UserDefaults.standard.set(sender.isOn, forKey: "switchIsOn")
//        UserDefaults.standard.set(sender.isOn, forKey: "number")
//        UserDefaults.standard.set(sender.isOn, forKey: "string")
    }
    
    private func updateUI(isOn: Bool) {
        intLabel.text = isOn ? "\(Int(42))" : "\(Int(357))"
        stringLabel.text = isOn ? "No Homework from now on" : "Nope, still more homework"
        view.backgroundColor = isOn ? .orange : .darkGray
        switchView.isOn = isOn
    }
    
}
