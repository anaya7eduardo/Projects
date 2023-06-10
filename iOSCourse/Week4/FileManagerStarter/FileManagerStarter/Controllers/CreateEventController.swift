//
//  CreateEventController.swift
//  FileManagerStarter
//
//  Created by Admin on 12/7/21.
//

import UIKit

class CreateEventController: UIViewController {

    
    @IBOutlet weak var createEventsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set ViewController As The Delegate For TextField
        createEventsTextField.delegate = self
        
        //Instantiate Default Event Values
        event = Event(date: Date(), name: "FileManager Default Name")
        
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        //Update Date Or Event
        event?.date = sender.date
    }
    
    @IBAction func createPressed(_ sender: Any) {
    }
    
}

extension CreateEventController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Dismiss The Keyboard
        textField.resignFirstResponder()
        
        //Update Name Of Event
        event?.name = textField.text ?? "No Event Name"
        
        return true
    }
}
