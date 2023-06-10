//
//  ViewController.swift
//  MotosTableView
//
//  Created by Eduardo Anaya on 11/23/21.
//

import UIKit

class MotosListVC: UIViewController {

    var tableView = UITableView()
    var motos: [Moto] = []
    let motoCell = "motoCell"

    override func viewDidLoad() {
        view.backgroundColor = .green
        title = "Top Exotic Motos"
        configureTableView()
        setTableViewDelegates()
        motos = fetchData()
        configureTableView()
        setTableViewDelegates()
        super.viewDidLoad()

    }

    func configureTableView() {
        //manually adding tableview to VC programmatically
        view.addSubview(tableView)
        tableView.rowHeight = 100
        //set delegates
        //set row height
        //register cells
        //set constraints
        tableView.register(MotoTableViewCell.self, forCellReuseIdentifier: motoCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MotosListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return motos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: motoCell) as! MotoTableViewCell
        let moto = motos[indexPath.row]
        cell.set(moto)
        
        return cell
    }
}

extension MotosListVC {
    
    /*
     static let apriliaRS = UIImage(named: "ApriliaRS660.jpeg")!
     static let ducatiC = UIImage(named: "DucatiCorse.jpeg")!
     static let harleyD = UIImage(named: "HarleyDavidson.jpeg")!
     static let hondaR3 = UIImage(named: "HondaRebel300.jpeg")!
     static let hondaR5 = UIImage(named: "HondaRebel500.jpeg")!
     static let indian = UIImage(named: "Indian.jpeg")!
     static let suzukiG = UIImage(named: "SuzukiGSX.jpeg")!
     static let triumphR = UIImage(named: "TriumphRocketIII.jpeg")!
     static let zeroD = UIImage(named: "ZeroDSZF7.jpeg")!
     static let zeroN = UIImage(named: "ZeroNAZF14.jpeg")!
     */
    
    func fetchData() -> [Moto] {
        let moto1 = Moto(image: Images.apriliaRS, title: "Aprilia RS 660")
        let moto2 = Moto(image: Images.ducatiC, title: "Ducati Corser")
        let moto3 = Moto(image: Images.harleyD, title: "Harley Davidson")
        let moto4 = Moto(image: Images.hondaR3, title: "Honda Rebel 300")
        let moto5 = Moto(image: Images.hondaR5, title: "Honda Rebel 500")
        let moto6 = Moto(image: Images.indian, title: "Indian Motorcycle")
        let moto7 = Moto(image: Images.suzukiG, title: "Suzuki GSX")
        let moto8 = Moto(image: Images.triumphR, title: "Triumph Rocket III")
        let moto9 = Moto(image: Images.zeroD, title: "Zero DS ZF7")
        let moto10 = Moto(image: Images.zeroN, title: "Zero DS ZF14")
        
        return [moto1, moto2, moto3, moto4, moto5, moto6, moto7, moto8, moto9, moto10]
    }
}

