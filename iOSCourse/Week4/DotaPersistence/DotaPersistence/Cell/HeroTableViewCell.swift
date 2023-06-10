//
//  HeroTableViewCell.swift
//  DotaPersistence
//
//  Created by Eduardo Anaya on 12/9/21.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    var link: ViewController?
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let starButton = UIButton(type: .system)
        starButton.setImage(UIImage(named: "fav_star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        starButton.tintColor = .red
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
        accessoryView = starButton
        
    }
    
    @objc private func handleMarkAsFavorite() {
        link?.someMethod(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
