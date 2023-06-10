//
//  ViewController.swift
//  Tuesday
//
//  Created by Eduardo Anaya on 11/30/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
    }

    func fetchData() {
        let session = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let task = session.dataTask(with: url) {data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something Went Wrong")")
                return
            }
            guard let responseData = data else {
                print("No Data Came Back")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Not Valid HTTP Response")
                return
            }
            //Response Status
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Status Debug: \(httpResponse.debugDescription)")
            print("Response Status LocalizedString: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            //Parse The Result As JSON
            do {
                guard let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) else { return }
                //print(jsonData)
                guard let jsonArray = jsonData as? [Any] else { return }
                for post in jsonArray {
                    guard let postDict = post as? [String: Any] else { return }
                    guard let postBody = postDict["body"] as? String else { return }
                    guard let postID = postDict["id"] as? Int else { return }
                    guard let postTitle = postDict["title"] as? String else { return }
                    guard let postUserID = postDict["userId"] as? Int else { return }
                    
                    print("Title: \(postTitle)")
                    print("Body: \(postBody)")
                    print("UserID: \(postUserID)")
                    print("ID: \(postID)")
                    //Printing Empty String For Spacing
                    print("...")
                }
            }
        }
        task.resume()
    }

}

