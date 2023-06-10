//
//  DetailViewController.swift
//  Movies
//
//  Created by Eduardo Anaya on 12/1/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var imageLbl: UIImageView!
    @IBOutlet weak var overviewLbl: UILabel!
    
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        releaseDateLbl.text = "Released: " + movie!.releaseDate
        let baseURL = "https://image.tmdb.org/t/p/w500/" + movie!.image
        let url = URL(string: baseURL)
        //Need To Fetch Image
        imageLbl.getImage(from: url!)
        overviewLbl.text = movie?.overview
    }

    @IBAction func dismissButton(_ sender: Any) {
        //self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}
