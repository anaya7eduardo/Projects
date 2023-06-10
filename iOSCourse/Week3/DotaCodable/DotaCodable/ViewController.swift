//
//  ViewController.swift
//  DotaCodable
//
//  Created by Eduardo Anaya on 12/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        setupTableView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        fetchJSON() {
            self.tableview.reloadData()
        }
        tableview.delegate = self
        tableview.dataSource = self
    }

/*
 Closures : Escaping & Un-Escaping
 A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. Escaping closures outlive the function it was passed into
 
 https://www.appypie.com/escaping-closures-swift
 https://betterprogramming.pub/escaping-and-non-escaping-closures-in-swift-fe2866309599
 */
func fetchJSON(completed: @escaping ()->()) {
    guard let url = URL(string: "https://api.opendota.com/api/heroStats") else { return }
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
            //Instead Of First Serializing The JSON With JSONSerialization Class Or Associated Functions We Can Instead Let The Instance Of Our Array Of Heroes Hold The Decoded Data Directly
            self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
            DispatchQueue.main.async {
                //Here We Call The Closure To Indicate This Is Where The Results Of The Fetch Should Be Used
                completed()
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }

    }
    task.resume()
}
    
}

// https://api.opendota.com/api/heroStats

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = heroes[indexPath.row].name.capitalized
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.hero = heroes[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
    
}
