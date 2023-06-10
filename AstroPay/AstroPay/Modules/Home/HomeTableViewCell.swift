//
//  HomeTableViewCell.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
