//
//  SchoolsListTableViewController.swift
//  20230316-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 3/16/23.
//

import UIKit

class SchoolsListTableViewController: UITableViewController {

    @IBOutlet var SchoolsTableView: UITableView!
    
    var schoolsViewModel: SchoolListViewModel!
    
    override func viewDidLoad() {
        setupDelegates()
        super.viewDidLoad()
    }
    
    func setupDelegates() {
        SchoolsTableView.delegate = self
        SchoolsTableView.dataSource = self
        schoolsViewModel = SchoolListViewModel(networkManager: NetworkManager())
        schoolsViewModel.getSchoolList(urlString: APIEndpoints.schoolList)
        schoolsViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsViewModel.schoolList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolListCell = tableView.dequeueReusableCell(withIdentifier: "SchoolsListTableViewCell")
        schoolListCell?.textLabel?.text = schoolsViewModel.schoolList[indexPath.row].schoolName
        schoolListCell?.detailTextLabel?.text = "\(schoolsViewModel.schoolList[indexPath.row].phoneNumber), \(schoolsViewModel.schoolList[indexPath.row].website)"
        return schoolListCell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "schoolsSegue", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controlSegue = segue.destination as? SchoolSATInfoViewController, let indexPath = SchoolsTableView.indexPathForSelectedRow {
            controlSegue.school = schoolsViewModel.schoolList[indexPath.row]
        }
    }

}

extension SchoolsListTableViewController: RefreshUIProtocol {
    func refreshMyUIScreen() {
        DispatchQueue.main.async {
            self.SchoolsTableView.reloadData()
        }
    }
}
