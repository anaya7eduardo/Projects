//
//  ViewController.swift
//  WedCD
//
//  Created by Admin on 12/7/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var tableview: UITableView!
    
    //create instance of DatabaseHandler
    let database = DatabaseHandler()
    var users: [User]? {
        didSet {
            /*
             with the didSet property observer the code below executes whenever a property has changed
             that means for us the array of User objects is updated we reload the tableview in real time
             https://nshipster.com/swift-property-observers/
             */
            self.tableview.reloadData()
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //step 1.
//        let results = database.fetch(User.self)
        // step 2.
        users = database.fetch(User.self)
        //checking to see if we are saving to core data
//        print(results.map { $0.name })
    }

    @IBAction func saved(_ sender: Any) {
        //calling save to persist data
        save()
    }
    //MARK: - Helper Functions
    func setupDelegates() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func save() {
        guard let user = database.add(User.self) else { return }
        guard let name = nameTextField.text, let ageText = ageTextField.text, let age = Int16(ageText) else { return }
        user.name = name
        user.age = age
        user.createdDate = Date()
        users?.append(user)
        database.save()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = users?[indexPath.row].name
//        cell.detailTextLabel?.text = "\(String(describing: person?.age))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            print("inserting...")
        case .delete:
            print("deleting...")
            guard let user = users?[indexPath.row] else { return }
            //Begins a series of method calls that insert, delete, or select rows and sections of the table view.
            tableView.beginUpdates()
            users?.remove(at: indexPath.row)
            //delte user from coredata
            database.delete(user)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Concludes a series of method calls that insert, delete, select, or reload rows and sections of the table view
            tableView.endUpdates()
        default:
            break
        }
    }
    
}
