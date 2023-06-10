//
//  ViewController.swift
//  FileManagerSample
//
//  Created by Eduardo Anaya on 12/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         FileManager is useful when you desire to work with and persist file types that you cannot easily store in core data, like images.
         */
        /*
         Singleton instance of FileManager that has access to documents directory of the app
         */
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        /*
         Because we are using a simulator we are able to access the path of documents directory as it is local to the machine we are using. Printing the path here exposes to directory for our app
         
         Copy the url in console and open the path in terminal
         
         This is the folder being used by the chosen simulator as the documents directory for our app
         */
        
        print(url.path)
        
        //let newfolderPath = url.appendingPathComponent("FileManager")
        let secondsubDirectory = url.appendingPathComponent("second-directory").appendingPathComponent("FileManager")
        
        do {
            let data = "Contents of file now open to the public".data(using: .utf8)
            //This will allow us to add directories to our app
            try manager.createDirectory(at: secondsubDirectory, withIntermediateDirectories: true, attributes: [:])
            let filepath = secondsubDirectory.appendingPathComponent("Logs.txt")
            manager.createFile(atPath: filepath.path, contents: data, attributes: [FileAttributeKey.creationDate : Date()])
        } catch {
            print(error)
        }
        
    }

}

