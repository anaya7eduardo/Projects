//
//  ViewController.swift
//  UIKitAndSwiftUIBoth
//
//  Created by unkn0wn on 2/28/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToSwiftUIButtonAction(_ sender: Any) {
        let swiftUIScreen = UIHostingController(rootView: ExampleView(navigateController: self.navigationController))
        self.navigationController?.pushViewController(swiftUIScreen, animated: true)
    }
    
}

