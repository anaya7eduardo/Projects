//
//  HomeViewController.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var accountNmbrTitleLbl: UILabel!
    @IBOutlet weak var accountNmbrLbl: UILabel!
    @IBOutlet weak var balanceTitleLbl: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var homeTableView: UITableView!
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        homeTableView.dataSource = self
        setupLocalLanguage()
        accountNmbrLbl.text = homeViewModel.getAccountDetails().accountNumber
        balanceLbl.text = "$\(homeViewModel.getAccountDetails().balance) USD"
        
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.getAccountDetails().transactionHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "cellHome", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        let home = homeViewModel.getAccountDetails()
        
        cell.amountLbl.text = "$\(home.transactionHistory[indexPath.row].amount) USD"
        cell.dateLbl.text = home.transactionHistory[indexPath.row].transactionDate
        cell.typeLbl.text = home.transactionHistory[indexPath.row].type.rawValue.localized()
        
        return cell
    }
    
    private func setupLocalLanguage() {
        accountNmbrTitleLbl.text = "Account Number".localized()
        balanceTitleLbl.text = "Balance".localized()
    }
}
