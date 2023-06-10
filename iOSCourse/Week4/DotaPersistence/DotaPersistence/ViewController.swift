//
//  ViewController.swift
//  DotaPersistence
//
//  Created by Eduardo Anaya on 12/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    func someMethod(cell: UITableViewCell) {
        let indexPathTapped = tableView.indexPath(for: cell)
        //print(indexPathTapped)
        let name = heroes[indexPathTapped!.row].name
        print(name)
    }
    
    let cellID = "HeroTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    var favorite = [Bool]()
    var heroes = [Hero]()
    let API = "https://api.opendota.com"
    
    override func viewDidLoad() {
        setupTableView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func setupTableView() {
        fetchJSON() {
            self.tableView.reloadData()
        }
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchJSON(completed: @escaping ()->()) {
        guard let url = URL(string: "\(API)/api/heroStats") else { return }
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
                self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                DispatchQueue.main.async {
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
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HeroTableViewCell
        cell.link = self
        //let star = "grayStar"
        //cell.accessoryView = UIImageView(image: UIImage(named: star))
        //accessoryView(cell: cell, star: star, indexPath: indexPath)
        
        let baseURL = API + (heroes[indexPath.row].image)
        let url = URL(string: baseURL)
        cell.heroImageView.getImage(from: url!)
        
        cell.heroNameLabel.text = heroes[indexPath.row].name.capitalized
        
        cell.selectionStyle = .none
        return cell
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as! HeroTableViewCell
        
        //let star = "yellowStar"
        //cell.accessoryView = UIImageView(image: UIImage(named: star))
        //accessoryView(cell: cell, star: star, indexPath: indexPath)
        
        //favorite[indexPath.row] = true
        print("\(heroes[indexPath.row].name) favorite")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as! HeroTableViewCell
        
        //let star = "grayStar"
        //cell.accessoryView = UIImageView(image: UIImage(named: star))
        //accessoryView(cell: cell, star: star, indexPath: indexPath)
        
        //favorite[indexPath.row] = false
        print("\(heroes[indexPath.row].name) unfavorite")
    }
    */

    /*
    func accessoryView(cell: UITableViewCell, star: String, indexPath: IndexPath) {
        let favButton = UIButton(type: .custom)
        favButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        favButton.addTarget(self, action: #selector(ViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        favButton.setImage(UIImage(named: star), for: .normal)
        favButton.contentMode = .scaleAspectFill
        favButton.tag = indexPath.row
        cell.accessoryView = favButton as UIView
    }
    
    @objc func accessoryButtonTapped(sender: UIButton) {
        print("\(heroes[sender.tag].name) : Tapped")
    }
    */
    
}
