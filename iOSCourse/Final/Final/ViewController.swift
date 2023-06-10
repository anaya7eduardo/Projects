//
//  ViewController.swift
//  Final
//
//  Created by Eduardo Anaya on 12/11/21.
//

import UIKit

class ViewController: UIViewController {

    var jokeString = ""
    override func viewDidLoad() {
        getData(from: APIEndpoint.jokeAPI)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//MARK: -IBActions
    @IBAction func barTapped(_ sender: Any) {
        print("Bar Tapped!")
    }
    @IBAction func bookTapped(_ sender: Any) {
        print("Book Tapped!")
    }
    @IBAction func foodTapped(_ sender: Any) {
        print("Food Tapped!")
    }
    @IBAction func ideaTapped(_ sender: Any) {
        print("Idea Tapped!")
    }
    @IBAction func movieTapped(_ sender: Any) {
        print("Movie Tapped!")
    }
    @IBAction func musicTapped(_ sender: Any) {
        print("Music Tapped!")
    }
    @IBAction func personTapped(_ sender: Any) {
        print("Person Tapped!")
    }
    @IBAction func placeTapped(_ sender: Any) {
        print("Place Tapped!")
    }
    @IBAction func productTapped(_ sender: Any) {
        print("Product Tapped!")
    }
    @IBAction func jokeButtonPressed(_ sender: Any) {
        //print("Joke On It's Way!...")
        getData(from: APIEndpoint.jokeAPI)
        //https://geek-jokes.sameerkumar.website/api?format=json
        alertDialogWithImage(msg: "\n\n\(self.jokeString)", Icon: UIImage(named: "Joke")!)
    }
    
    //MARK: -AlertDialog
    func alertDialogWithImage(msg : String, Icon : UIImage) {
        let attributedString = NSAttributedString(string: msg, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        
        let alrt = UIAlertController(title: " ", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alrt.setValue(attributedString, forKey: "attributedMessage")
        
        let cancel = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel) { (action) in
            
        }
        
        alrt.addAction(cancel)
        
        let subview = (alrt.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        subview.backgroundColor = UIColor(red: (115/255.0), green: (50/255.0), blue: (205/255.0), alpha: 0.65)
        
        alrt.view.tintColor = UIColor.green
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 5, width: 65, height: 65))
        
        imageView.image = Icon
        
        alrt.view.addSubview(imageView)
        
        self.present(alrt, animated: true, completion: nil)
        
    }
    
    //MARK: -GetData
    private func getData(from url: String) {
       let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Something Went Wrong")
                return
            }
            
            var result: Joke?
            do {
                result = try JSONDecoder().decode(Joke.self, from: data)
            } catch {
                print("Failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
           self.jokeString = json.joke
           //print(self.jokeString)
        })
        task.resume()
        
    }
    
    
}

