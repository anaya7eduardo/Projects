//
//  CreateEventController.swift
//  MondayFileManager2
//
//  Created by Admin on 12/5/21.
//

import UIKit

class CreateEventController: UIViewController {
    @IBOutlet weak var createEventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var event: Event?
    
    override func viewDidLoad() {
        setupController()
        super.viewDidLoad()
       
    }
    
    func setupController() {
        createEventTextField.delegate = self
        //instantiate default value for event
        event = Event(date: Date(), name: "default name")
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        //update date of event
        event?.date = sender.date
    }
}

extension CreateEventController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
        //dismiss keyboard
        textField.resignFirstResponder()
        
        //update name of event
        //must use simulator keyboard to update text name for event [shift command K to enable] 
        event?.name = textField.text ?? "No event name given"
        return true
    }
}
