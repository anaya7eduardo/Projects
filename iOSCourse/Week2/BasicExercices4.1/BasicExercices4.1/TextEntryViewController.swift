//
//  TextEntryViewController.swift
//  BasicExercices4.1
//
//  Created by Eduardo Anaya on 11/24/21.
//

import UIKit

class TextEntryViewController: UIViewController {

    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Name..."
        field.textColor = .black
        field.backgroundColor = .white
        return field
    }()
    
    public var completion: ((String?)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Name"
        view.backgroundColor = .lightGray
        
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
        view.addSubview(field)
        field.frame = CGRect(x: 20, y: 100, width: view.frame.size.width-40, height: 55)
        field.becomeFirstResponder()
    }
    
    @objc private func didTapDoneButton() {
        completion?(field.text)
        dismiss(animated: true, completion: nil)
    }

}
