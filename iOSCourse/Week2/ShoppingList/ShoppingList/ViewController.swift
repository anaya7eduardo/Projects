//
//  ViewController.swift
//  ShoppingList
//
//  Created by Eduardo Anaya on 11/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    let vc = TableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "My Main ViewController"
    }
    
    @IBAction func didTapFirstButton(_ sender: Any) {
        vc.groceryList = ["Pokemon Blue", "Pokemon Red", "Pokemon Yellow", "Pokemon Silver", "Pokemon Gold", "Pokemon Crystal"]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

