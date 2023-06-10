//
//  CryptoViewController.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import UIKit

class CryptoViewController: UIViewController {

    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupLocalLanguage()
    }
    
    @IBAction func purchaseButtonAction(_ sender: Any) {
        print("TESTING PURCHASE BUTTON")
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        print("TESTING SEND BUTTON")
    }
    
    @IBAction func sellButtonAction(_ sender: Any) {
        print("TESTING SELL BUTTON")
    }
 
    private func setupLocalLanguage() {
        purchaseButton.setTitle("Purchase".localized(), for: .normal)
        sendButton.setTitle("Send".localized(), for: .normal)
        sellButton.setTitle("Sell".localized(), for: .normal)
    }
}
