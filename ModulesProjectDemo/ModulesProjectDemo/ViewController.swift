//
//  ViewController.swift
//  ModulesProjectDemo
//
//  Created by unkn0wn on 3/23/23.
//

import UIKit
import NetworkPackage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let networkManager = NetworkManager()
        
        networkManager.download()
        
    }


}

