//
//  SchoolSATInfoViewController.swift
//  20230316-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 3/16/23.
//

import UIKit

class SchoolSATInfoViewController: UIViewController {
    
    var schoolsViewModel: SchoolListViewModel!
    
    var school: SchoolInfo?
    var satInfo: SATInfo?

    @IBOutlet weak var SchoolNameTextView: UITextView!
    @IBOutlet weak var MathScoreLabel: UILabel!
    @IBOutlet weak var ReadingScoreLabel: UILabel!
    @IBOutlet weak var WritingScoreLabel: UILabel!
    @IBOutlet weak var OverviewTextView: UITextView!
    
    override func viewDidLoad() {
        setupDelegates()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        SchoolNameTextView.text = school?.schoolName
        OverviewTextView.text = school?.overviewParagraph ?? "???"
    }
    
    func setupDelegates() {
        schoolsViewModel = SchoolListViewModel(networkManager: NetworkManager())
        schoolsViewModel.getSchoolSATInfo(urlString: APIEndpoints.satInfo, dbn: school!.dbn)
        schoolsViewModel.delegate = self
    }

}

extension SchoolSATInfoViewController: RefreshUIProtocol {
    func refreshMyUIScreen() {
        DispatchQueue.main.async {
            self.MathScoreLabel.text = self.schoolsViewModel.toNumbFromString(string: self.schoolsViewModel?.schoolSATInfo.first?.satMathAvgScore ?? "0")
            self.ReadingScoreLabel.text = self.schoolsViewModel.toNumbFromString(string: self.schoolsViewModel?.schoolSATInfo.first?.satCriticalReadingAvgScore ?? "0")
            self.WritingScoreLabel.text = self.schoolsViewModel.toNumbFromString(string: self.schoolsViewModel?.schoolSATInfo.first?.satWritingAvgScore ?? "0")
        }
    }
}
