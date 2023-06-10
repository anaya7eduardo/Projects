//
//  CustomTableViewCell.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/16/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCustomCell: UIImageView!
    @IBOutlet weak var labelNameCustomCell: UILabel!
    @IBOutlet weak var labelPriceCustomCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
