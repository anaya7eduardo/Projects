//
//  SecondViewController.swift
//  TabAndNavList
//
//  Created by Eduardo Anaya on 11/22/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapFirstButton(_ sender: Any) {
        let vc = TableViewController()
        vc.genList = ["Pokemon Red", "Pokemon Blue", "Pokemon Yellow"]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapSecondButton(_ sender: Any) {
        let vc = TableViewController()
        vc.genList = ["Pokemon Silver", "Pokemon Gold", "Pokemon Crystal"]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapThirdButton(_ sender: Any) {
        let vc = TableViewController()
        vc.genList = ["Pokemon Ruby", "Pokemon Sapphire", "Pokemon Emerald"]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
