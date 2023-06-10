//
//  ViewController.swift
//  iOSNetworkingExample
//
//  Created by Admin on 11/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = [
            "title", "Week 2 Day 1",
            "body", "Making network requests using URLSession"
        ]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonData!)
            }
            // in order to update UI with returning data we must move from a background thread back to the main thread
            DispatchQueue.main.async {
                self.view.backgroundColor = .cyan
            }
        }.resume()
        
    }
    //Make the request with URLSessionDataTask
    func fetchPosts() {
        /*
        note that we’re assigning the return value of dataTask(with:completionHandler:) to the task constant. This is that data task, as discussed earlier, of type URLSessionDataTask
        */
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        /*
        For basic requests, the URLSession class provides a shared singleton session object that gives you a reasonable default behavior for creating tasks. Use the shared session to fetch the contents of a URL to memory with just a few lines of code
        */
        // MARK: URLSession
        /*
        The URLSession.shared singleton is a reference to a shared URLSession instance that has no configuration. It’s more limited than a session that’s initialized with a URLSessionConfiguration object, but that’s OK for now.

        You can construct URLs and access their parts. For URLs that represent local files, you can also manipulate properties of those files directly, such as changing the file’s last modification date. Finally, you can pass URLs to other APIs to retrieve the contents of those URLs. For example, you can use URLSession and its related classes to access the contents of remote resources

        The initializer we’re using is failable, but since we’re certain the URL is correct, we use force-unwrapping to deal with the optional.
        */
        let session = URLSession.shared.dataTask(with: url) { data, reponse, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response: \(String(describing: jsonData))")
            }
        }.resume()
    }
}
