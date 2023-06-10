//
//  ViewController.swift
//  FetchData
//
//  Created by Eduardo Anaya on 11/29/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://api.coinbase.com/v2/currencies") else { return }
        
        let _ : Void = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                do {
                    let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                    print("Data: \(String(describing:jsonData))")
                } catch {
                    print(error)
                }
            }
        }
            .resume()
    }

}

