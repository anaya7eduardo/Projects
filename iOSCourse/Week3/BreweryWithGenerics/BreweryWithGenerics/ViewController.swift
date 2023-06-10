//
//  ViewController.swift
//  BreweryWithGenerics
//
//  Created by Eduardo Anaya on 12/2/21.
//
//Name
//City+State

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var brewery = [Brewery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDelegates()
        fetchBrewery()
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchBrewery() {
        URLSession.shared.getRequest(url: APIEndpoints.breweries, decoding: [Brewery].self) {
            result in
            switch result {
            case .success(let brewery):
                self.brewery = brewery
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
        return brewery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = brewery[indexPath.row].name.capitalized
        
        if (brewery[indexPath.row].state) != nil {
            cell.detailTextLabel?.text = "\(brewery[indexPath.row].city), \((brewery[indexPath.row].state)!)"
        }
        
        return cell
    }
}

