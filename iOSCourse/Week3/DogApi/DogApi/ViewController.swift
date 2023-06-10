//
//  ViewController.swift
//  DogApi
//
//  Created by Eduardo Anaya on 12/1/21.
//

import UIKit

/*
 en-codable de-codable
 Codables is a typealias for the Encodable and Decodable protocols. When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols
 */

struct Dog:Codable {
    let message: URL
}

class ViewController: UIViewController {

    @IBOutlet weak var dogImage: UIImageView!
    
    let urlString = "https://dog.ceo/api/breeds/image/random"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchImage() {
        guard let url = URL(string: urlString) else { print("Error: Bad URL"); return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Data Available")
                return
            }
            guard response != nil else {
                print(error?.localizedDescription ?? "No Response Returned")
                return
            }
            /*
             If Successful, This Data Now Needs To Be Converted To JSON. Marking our API response struct Dog:Codable means we will be able to use the JSONDecoder() to decode the response object rather than serializing it with JSONSerialization
             */
            do {
                let jsonResponse = try JSONDecoder().decode(Dog.self, from: data)
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: jsonResponse.message) {
                        //Move Back To Main Thread
                        DispatchQueue.main.async {
                            self.dogImage.image = UIImage(data: imageData)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    @IBAction func fetchPhotoTapped(_ sender: Any) {
        fetchImage()
    }
    
}

