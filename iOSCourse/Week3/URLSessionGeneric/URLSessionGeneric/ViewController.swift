//
//  ViewController.swift
//  URLSessionGeneric
//
//  Created by Eduardo Anaya on 12/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var user = [User]()
    var post = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDelegates()
        //fetchUser()
        fetchPost()
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    /*
     Reslt Type: Swift's result type is an enum that has two cases (success, failure). We can use a specific error type as we have or use what is provided. This Result Type allows us to have typed throws in Swift
     https://www.hackingwithswift.com/articles/161/how-to-use-result-in-swift
     https://www.avanderlee.com/swift/result-enum-type/
     */
    
    /*
    func fetchUser() {
        URLSession.shared.getRequest(url: APIEndpoints.users, decoding: [User].self) {
            result in
            switch result {
            case .success(let user):
                self.user = user
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    */
    
    func fetchPost() {
        URLSession.shared.getRequest(url: APIEndpoints.posts, decoding: [Post].self) {
            result in
            switch result {
            case .success(let post):
                self.post = post
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return user.count
        return post.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = user[indexPath.row].name.capitalized
        //cell.detailTextLabel?.text = user[indexPath.row].email
        cell.textLabel?.text = post[indexPath.row].title.capitalized
        cell.detailTextLabel?.text = post[indexPath.row].body
        return cell
    }
}
