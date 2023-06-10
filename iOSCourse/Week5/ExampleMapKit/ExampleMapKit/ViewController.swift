//
//  ViewController.swift
//  ExampleMapKit
//
//  Created by Eduardo Anaya on 12/15/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -UIReferences
    @IBOutlet weak var tableView: UITableView!
    let cellID = "UserTableViewCell"
    var users = [User]()
    
    //MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDelegates()
    }
    
    //MARK: -Functions
    func setupTableViewDelegates() {
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        fetchJSON {
            self.tableView.reloadData()
        }
    }
    
    func fetchJSON(completed: @escaping ()->()) {
        guard let url = APIEndpoints.randomuserAPI else { return }
        let session = URLSession.shared
        
        let task =  session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something Happened Here")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server Error")
                return
            }
            
            guard data != nil else {
                print("Error: We Have No Data Bub")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(Raw.self, from: data!)
                self.users = results.object
                DispatchQueue.main.async {
                    //print(self.users)
                    completed()
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }

        }
        task.resume()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.setupCell(user)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.users = users[(tableView.indexPathForSelectedRow?.row)!]
            //let user = users[(tableView.indexPathForSelectedRow?.row)!]
            //vc.setupDetail(user)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
