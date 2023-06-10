//
//  ListViewController.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/15/23.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    private var items = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    private var planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
    private var viewModel:EmployeeViewModel!
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        viewModel = EmployeeViewModel()
        viewModel.getEmployeeList(urlString: APIEndpoints.EmployeeEndpoint)
        viewModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        viewModel.refreshUI = {
//            DispatchQueue.main.async {
//                self.myTableView.reloadData()
//            }
//        }
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.employeeList.count
        } else if section == 1 {
            return planets.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SampleTableViewCell
            cell.labelCell.text = viewModel.employeeList[indexPath.row].firstName
            cell.imageCell.image = UIImage(systemName: "shareplay")
            return cell
        } else if indexPath.section == 1 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
            customCell.labelNameCustomCell.text = planets[indexPath.row]
            customCell.imageCustomCell.tintColor = .customColor
            customCell.labelPriceCustomCell.text = "Price $\(indexPath.row + 1)"
            return customCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCollectionCell") as! TableCollectionCell
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var weekDay = ""
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.section == 0 {
            weekDay = viewModel.employeeList[indexPath.row].firstName
            
//            let webViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
//            webViewController.name = weekDay
//            self.navigationController?.pushViewController(webViewController, animated: true)
            mainCoordinator?.navigateToDetailsViewController(data: weekDay)
            
        } else {
            weekDay = planets[indexPath.row]
            
//            let gridVC = storyBoard.instantiateViewController(withIdentifier: "GridViewController") as! GridViewController
//            self.navigationController?.pushViewController(gridVC, animated: true)
            mainCoordinator?.navigateToWebviewController()
            
        }
        print(weekDay)
    }
}

extension ListViewController: RefreshUIProtocol {
    func refreshMyUIScreen() {
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
}
