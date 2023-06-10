//
//  SchoolDetailViewController.swift
//  20230215-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 2/15/23.
//

import Foundation
import UIKit

//MARK: Scrollview and labels.

class schoolPropertiesVC: UIViewController {
    //MARK: Declared variables to pass data through w/ basic formatting
    let schoolNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "School Name"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name:"ArialRoundedMTBold", size: 20.0)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    
    let mathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name:"HelveticaNeue", size: 20.0)
        label.text = "Math:"
        label.textAlignment = .center
        return label
    }()
    
    let readingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name:"HelveticaNeue", size: 20.0)
        label.text = "Reading:"
        label.textAlignment = .center
        return label
    }()
    
    let writingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name:"HelveticaNeue", size: 20.0)
        label.text = "Writing:"
        label.textAlignment = .center
        return label
    }()
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 20
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.font = UIFont(name:"HelveticaNeue", size: 18.0)
        label.text = "Overview:"
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        label.textColor = .black
        return label
    }()
    
    let schoolViewModel: SchoolListViewModelType?
    let index: Int
    
    init(vm: SchoolListViewModelType?, index: Int) {
        self.schoolViewModel = vm
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundImage = UIImageView(image: UIImage(named: "matrix"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        backgroundImage.addSubview(blurEffectView)
        view.addSubview(backgroundImage)
        
        
        //MARK: Added labels to view to set background
        self.view.backgroundColor = .white
        view.addSubview(schoolNameLabel)
        view.addSubview(mathLabel)
        view.addSubview(readingLabel)
        view.addSubview(writingLabel)
        view.addSubview(overviewLabel)
        
        //MARK: Setting up label constraints
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: Update the view on main queue
        self.schoolViewModel?.bind { [weak self] in
            DispatchQueue.main.async {
                self?.update()
            }
        }
        
        self.schoolViewModel?.getSchoolSATInfo(index: self.index)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.schoolViewModel?.unbind()
    }
    
    
    func setupUI(){
        //MARK: Setting constraints for various labels
        
        schoolNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        schoolNameLabel.bottomAnchor.constraint(equalTo: schoolNameLabel.topAnchor, constant: 60).isActive = true
        schoolNameLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        schoolNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        mathLabel.topAnchor.constraint(equalTo: schoolNameLabel.bottomAnchor, constant: 5).isActive = true
        mathLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mathLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mathLabel.bottomAnchor.constraint(equalTo: mathLabel.topAnchor, constant: 40).isActive = true
        
        readingLabel.topAnchor.constraint(equalTo: mathLabel.bottomAnchor, constant: 5).isActive = true
        readingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        readingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        readingLabel.bottomAnchor.constraint(equalTo: readingLabel.topAnchor, constant: 40).isActive = true
        
        writingLabel.topAnchor.constraint(equalTo: readingLabel.bottomAnchor, constant: 8).isActive = true
        writingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        writingLabel.bottomAnchor.constraint(equalTo: writingLabel.topAnchor, constant: 40).isActive = true
        writingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        overviewLabel.topAnchor.constraint(equalTo: readingLabel.bottomAnchor, constant: 100).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    func update() {
        schoolNameLabel.text = self.schoolViewModel?.getSchoolName(index: self.index)
        mathLabel.text = "Math SAT: \(self.schoolViewModel?.getSATMath(index: self.index) ?? " ??? ")"
        readingLabel.text = "Reading SAT: \(self.schoolViewModel?.getSATReading(index: self.index) ?? " ??? " )"
        writingLabel.text = "Writing SAT: \(self.schoolViewModel?.getSATWriting(index: self.index) ?? " ??? ")"
        overviewLabel.text = "Overview: \(self.schoolViewModel?.getOverview(index: self.index) ?? " ??? ")"
    }
    
}
