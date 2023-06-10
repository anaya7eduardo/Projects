//
//  DetailsViewController.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/15/23.
//

import UIKit

class DetailsViewController: UIViewController {

    var name: String?
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsLabel.text = name ?? "Default"
    }

}
