//
//  SchoolListViewController.swift
//  20230215-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 2/15/23.
//

import Foundation
import UIKit

class SchoolListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SchoolListTableViewCell.self, forCellReuseIdentifier: SchoolListTableViewCell.reuseId)
        return tableView
    }()
    //MARK: Initilize ViewModel
    let viewModel: SchoolListViewModelType? = SchoolListViewModel()
    
    let backgroundImage = UIImageView(image: UIImage(named: "matrix"))
    
    override func viewDidLoad() {
        self.title = "NYC Schools' List"
        super.viewDidLoad()
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
        self.setUpUI()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(SchoolListTableViewCell.self, forCellReuseIdentifier: "cell")
        self.viewModel?.getSchools()
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        self.tableView.bindToSuperView(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.bind { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        if self.viewModel?.count == 0 {
            self.viewModel?.getSchools()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel?.unbind()
    }
    
}

extension SchoolListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolProperties = schoolPropertiesVC(vm: self.viewModel, index: indexPath.row)
        self.navigationController?.pushViewController(schoolProperties, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel!.count)
        return self.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SchoolListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(schoolName: self.viewModel?.getSchoolName(index: indexPath.row), phoneNumber: self.viewModel?.getPhoneNumber(index: indexPath.row), website: self.viewModel?.getWebsite(index: indexPath.row), overviewParagraph: self.viewModel?.getOverview(index: indexPath.row))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
        
}
