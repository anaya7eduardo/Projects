//
//  SampleTableViewCell.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/15/23.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
