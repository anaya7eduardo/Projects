//
//  FavoriteViewController.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 1/7/22.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let database = DatabaseHandler()
    var favCocktail: [FavCocktail]? {
        didSet {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDelegates()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "FavoriteViewController")
        tableview.tableFooterView = UIView(frame: .zero)
    }
    
    func setupDelegates() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favCocktail = database.fetch(FavCocktail.self)
        //checking to see if we are saving to core data
//        print(results.map { $0.name })
    }

}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favCocktail?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "FavoriteViewController")!
        let image : UIImage = UIImage(data: (favCocktail?[indexPath.row].thumbFav)!)!
        cell.imageView?.image = image
        cell.textLabel?.text = favCocktail?[indexPath.row].drinkFav
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(favCocktail?[indexPath.row].drinkFav ?? "TRYING TO PRINT SOMETHING 1")
//        print(favCocktail?[indexPath.row].descriptionFav ?? "TRYING TO PRINT SOMETHING 2")
//        print(favCocktail?[indexPath.row].instructionsFav ?? "TRYING TO PRINT SOMETHING 3")
        performSegue(withIdentifier: "detailSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ShowFavViewController {
            destination.favCocktail = favCocktail?[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
//        case .insert:
//            print("inserting...")
        case .delete:
//            print("deleting...")
            guard let cocktail = favCocktail?[indexPath.row] else { return }
            //Begins a series of method calls that insert, delete, or select rows and sections of the table view.
            tableView.beginUpdates()
            favCocktail?.remove(at: indexPath.row)
            //delte user from coredata
            database.delete(cocktail)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Concludes a series of method calls that insert, delete, select, or reload rows and sections of the table view
            tableView.endUpdates()
        default:
            break
        }
    }
}

extension Data {
    var uiImage: UIImage? { UIImage(data: self) }
}
