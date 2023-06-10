//
//  ViewController.swift
//  Monday
//
//  Created by Eduardo Anaya on 11/29/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchSomething()
        fetchOtherData()
    }
    
    func fetchSomething() {
        let params = [
            "title", "Week 3 or 3 Day 1",
            "body", "Making network requests using URLSession"
        ]
        guard let url = URL(string: "https://itunes.apple.com/search?term=evanescence") else { return }
        var request = URLRequest (url: url)
        request.httpMethod = "POST"
        request.setValue("Application/JSON", forHTTPHeaderField: "content-type")
        request.httpBody = try?
            JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try?
                JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonData!)
            }
            /*
             In order to update any UI elements with returning data we must move from a background threadd back to the main thread
             */
            DispatchQueue.main.async {
                self.view.backgroundColor = .cyan
            }
        }
            .resume()
    }
    
    func fetchPosts() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=evanescence") else { return }
        
        /*
         For basic regquests, the URLSession Class provides a shared singleton session object that gives you default behavior to fetch the contents of a URL to memory with a few lines of code
         */
        /*
         You can construct URLs and access their parts. For URLs that represent local files you can also manipulate properties of those files directly.
         */
        let _ : Void = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                /*
                 Here we are using the JSONObject(with:options:) function of the JSONDeserialization class to serialize the data to JSON. Essentially this data is read character by character and turned into a JSON Object we can easily read and manipulate.
                 
                 The optional binding with a failable try? can be used to temporarily silence any warnings from the jsonObject(...)
                 */
                do {
                    let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                    print("Response: \(String(describing:jsonData))")
                } catch {
                    print(error)
                }
            }
        }
            .resume()
    }
    
    func fetchOtherData() {
        let session = URLSession.shared
        guard let url = URL(string:"https://gist.githubusercontent.com/reinder42/932d7671859959f6363b4d9b4e18bb91/raw/306631d79a5166bb0d86b12ac7d8cc42fecb996e/users.json") else { return }
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Client Error!")
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server Error!")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

}
