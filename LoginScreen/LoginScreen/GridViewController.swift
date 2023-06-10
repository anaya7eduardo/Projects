//
//  GridViewController.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/16/23.
//

import UIKit

class GridViewController: UIViewController, RefreshUIProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var socials = ["WhatsApp", "Telegram", "Instagram", "Facebook", "Snapchat", "TikTok", "Twitter", "Reddit"]
    
    private var viewModel:EmployeeViewModel!
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel = EmployeeViewModel()
        viewModel.getEmployeeList(urlString: APIEndpoints.EmployeeEndpoint)
        viewModel.delegate = self
    }
    
    func refreshMyUIScreen() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension GridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(socials[indexPath.item])
        print(viewModel.employeeList[indexPath.item].firstName)
    }
}

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return socials.count
        return viewModel.employeeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! SampleCollectionViewCell
        cell.imageCollectionViewCell.tintColor = .customColor
//        cell.labelCollectionViewCell.text = socials[indexPath.item]
        cell.labelCollectionViewCell.text = viewModel.employeeList[indexPath.item].firstName
        return cell
    }
    
}
