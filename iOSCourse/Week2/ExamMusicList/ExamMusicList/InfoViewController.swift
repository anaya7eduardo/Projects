//
//  InfoViewController.swift
//  ExamMusicList
//
//  Created by Eduardo Anaya on 11/29/21.
//

import UIKit

class InfoViewController: UIViewController {
    var myObject : Album?
    @IBOutlet weak var titleV: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var descV: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray

        // Do any additional setup after loading the view.
        titleV.text = myObject?.title
        imageV.image = myObject?.image
        descV.text = myObject?.description
        let artistS:String? = myObject?.artist
        let yearS:String? = myObject?.year
        print("Artist: \(artistS!)")
        print("Year: \(yearS!)")
    }

}
