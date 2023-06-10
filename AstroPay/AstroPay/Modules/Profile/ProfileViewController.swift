//
//  ProfileViewController.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileTableView: UITableView!
    private let profileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileTableView.dataSource = self
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = profileTableView.dequeueReusableCell(withIdentifier: "cellProfile", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        
        let profile = profileViewModel.getUserProfile()
        
        switch indexPath.row {
            case 0 :
                cell.itemLbl.text = profile.name
            case 1:
                cell.itemLbl.text = profile.email
            default :
                cell.itemLbl.text = ""
        }
        return cell
    }
}
