//
//  SchoolListTableViewCell.swift
//  20230215-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 2/15/23.
//

import Foundation
import UIKit

class SchoolListTableViewCell: UITableViewCell {

    static let reuseId = "\(SchoolListTableViewCell.self)"
    
    lazy var schoolLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    lazy var schoolNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    lazy var websiteLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.backgroundColor = UIColor.cyan.withAlphaComponent(0.1)
        
        stackView.addArrangedSubview(self.schoolLabel)
        stackView.addArrangedSubview(self.schoolNumberLabel)
        stackView.addArrangedSubview(self.websiteLabel)
        
        self.contentView.addSubview(stackView)
        stackView.bindToSuperView(insets: UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7))
    }
    
    override func prepareForReuse() {
        self.schoolLabel.text = nil
    }
    
    func configure(schoolName: String?, phoneNumber: String?, website: String?, overviewParagraph: String?) {
        self.schoolLabel.text = "School Name: \(schoolName ?? " ??? ")"
        self.schoolNumberLabel.text = "Phone Number: \(phoneNumber ?? " ??? ")"
        self.websiteLabel.text = "School Email: \(website ?? " ??? ")"
    }

}
