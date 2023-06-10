//
//  DetailViewController.swift
//  BreweryFetch
//
//  Created by Eduardo Anaya on 11/30/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var brewery : Brewery?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.lightGray
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = "Name: \(brewery!.name)"
        typeLabel.text = "Type: \(brewery!.type)"
        addressLabel.text = "Address: \(brewery!.street)"
        
    }

}
