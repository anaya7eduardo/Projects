//
//  Extension+UITableViewCell.swift
//  DotaCodable
//
//  Created by Eduardo Anaya on 12/7/21.
//

import UIKit

class myCell: UITableViewCell {
    var link: ViewController?
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if let _ = UserDefaults.standard.boolArray {
        } else {
            let boolArray = false
            UserDefaults.standard.boolArray = Array(repeating: boolArray, count: 122)
        }
        let favButton = UIButton(type: .system)
        favButton.setImage(UIImage(named: "yellowStar"), for: .normal)
        favButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        favButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = favButton
    }
    
    @objc func handleMarkAsFavorite(cell : UITableViewCell) {
        link?.someMethodIWantToCall(cell: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented... yet.")
    }
}
