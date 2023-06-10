//
//  ViewController.swift
//  BreweryFetch
//
//  Created by Eduardo Anaya on 11/30/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    
    var breweries = [Brewery]()
    
    override func viewDidLoad() {
        fetchData()
        setupDelegates()
        self.view.backgroundColor = UIColor.systemTeal
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }

    func fetchData() {
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else { return }
        let task = session.dataTask(with: url) {data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something Went Wrong")")
                return
            }
            guard let responseData = data else {
                print("No Data Came Back")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Not Valid HTTP Response")
                return
            }
            //Response Status
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Status Debug: \(httpResponse.debugDescription)")
            print("Response Status LocalizedString: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            //Parse The Result As JSON
            do {
                guard let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) else { return }
                //print(jsonData)
                //Brewery Name, Type, City & State
                guard let jsonArray = jsonData as? [Any] else { return }
                for brew in jsonArray {
                    guard let breweryDict = brew as? [String: Any] else { return }
                    guard let Name = breweryDict["name"] as? String else { return }
                    guard let Type = breweryDict["brewery_type"] as? String else { return }
                    guard let City = breweryDict["city"] as? String else { return }
                    guard let State = breweryDict["state"] as? String else { return }
                    guard let Street = breweryDict["street"] as? String else { return }
                    
                    //print("Name: \(Name)")
                    //print("Type: \(Type)")
                    //print("Location: \(City), \(State)")
                    //print("Type: \(Street)")
                    //Printing Empty String For Spacing
                    //print("...")
                    self.breweries.append(Brewery(name: Name, type: Type, city: City, state: State, street: Street))
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = breweries[indexPath.row].name
        cell?.detailTextLabel?.text = "\(breweries[indexPath.row].city), \(breweries[indexPath.row].state)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "mySegue", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controlSegue = segue.destination as? DetailViewController, let indexPath = tableview.indexPathForSelectedRow {
                controlSegue.brewery = breweries[indexPath.row]
            }
    }

}

