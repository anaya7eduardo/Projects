//
//  DetailViewController.swift
//  DotaCodable
//
//  Created by Eduardo Anaya on 12/1/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    
    var hero:Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLbl.text = hero?.name
        attributeLbl.text = hero?.primaryAttribute
        attackLbl.text = hero?.attackType
        legsLbl.text = "\((hero?.legs)!)"
        let baseURL = "https://api.opendota.com" + (hero?.image)!
        let url = URL(string: baseURL)
        //Need To Fetch Image
        image.getImage(from: url!)
    }

}
