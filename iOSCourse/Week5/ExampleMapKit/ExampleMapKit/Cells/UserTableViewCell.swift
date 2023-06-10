//
//  UserTableViewCell.swift
//  ExampleMapKit
//
//  Created by Eduardo Anaya on 12/15/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    //MARK: -UIReferences
    @IBOutlet weak var userThumbnailImageView: UIImageView!
    @IBOutlet weak var userFullNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    //MARK: -AwakeFromNiB
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(_ user: User) {
        userThumbnailImageView.getImage(from: user.picture.medium)
        userFullNameLabel.text = user.name.title + ". " + user.name.first + " " + user.name.last
        userEmailLabel.text = user.email
    }
}
