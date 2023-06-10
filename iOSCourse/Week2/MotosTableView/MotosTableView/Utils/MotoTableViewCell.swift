//
//  MotoTableViewCell.swift
//  MotosTableView
//
//  Created by Eduardo Anaya on 11/23/21.
//

import UIKit

class MotoTableViewCell: UITableViewCell {

    var motoImageView = UIImageView()
    var motoTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(motoImageView)
        addSubview(motoTitle)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //passing through a car and setting image to specific car passed in array
    func set(_ moto: Moto) {
        motoImageView.image = moto.image
        motoTitle.text = moto.title
    }
    
    func configureImageView() {
        motoImageView.layer.cornerRadius = 10
        motoImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        motoTitle.numberOfLines = 0
        motoTitle.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        motoImageView.translatesAutoresizingMaskIntoConstraints = false
        motoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        motoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        motoImageView.widthAnchor.constraint(equalTo: motoImageView.heightAnchor, multiplier: 16/9).isActive = true
        motoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setTitleLabelConstraints() {
        motoTitle.translatesAutoresizingMaskIntoConstraints = false
        motoTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        motoTitle.leadingAnchor.constraint(equalTo: motoImageView.trailingAnchor, constant: 20).isActive = true
        motoTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        motoTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
