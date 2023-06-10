//
//  TableViewController.swift
//  ExamMusicList
//
//  Created by Eduardo Anaya on 11/29/21.
//

import UIKit

class TablewViewController: UITableViewController {
    
    /*
     coldplay : Coldplay-A_Rush_Of_Blood_To_The_Head-Frontal-2002
     crystal : Crystal_Castles-Crystal_Castles-Frontal-2008
     evanescence : Evanescence-Fallen-Frontal-2003
     korn : Korn-See_You_On_The_Other_Side-Frontal-2005
     mgmt : MGMT-Oracular_Spectacular-Frontal-2008
     muse : Muse-Black_Holes_And_Revelations-Frontal-2006
     nightwish : Nightwish-Once-Frontal-2004
     rammstein : Rammstein-Reise,_Reise-Frontal-2004
     rhcp : Red_Hot_Chili_Peppers-Stadium_Arcadium-Frontal-2006
     yeah : Yeah_Yeah_Yeahs-It_s_Blitz_-Frontal-2009
     */
    
    var myList = [
        Album(image: Images.coldplay, title: "A Rush Of Blood To The Head", artist: "Coldplay", year: "2002", description: "The UK quartet follows the critical and commercial success of their past debut album with this long-awaited follow-up release, which the band has suggested may be their last."),
        Album(image: Images.crystal, title: "Crystal Castles", artist: "Crystal Castles", year: "2008", description: "The debut full-length album for the Toronto duo of Ethan Kath and Alice Grass."),
        Album(image: Images.evanescence, title: "Fallen", artist: "Evanescence", year: "2003", description: "First studio album, and their first album to achieve widespread release around the world."),
        Album(image: Images.korn, title: "See You On The Other Side", artist: "Korn", year: "2005", description: "The Matrix co-produced the band's first album since 2003."),
        Album(image: Images.mgmt, title: "Oracular Spectacular", artist: "MGMT", year: "2008", description: "David Fridmann produced the debut full-length album for the New York-based band."),
        Album(image: Images.muse, title: "Black Holes And Revelations", artist: "Muse", year: "2006", description: "The stadium-sized English trio returns with a follow-up to its 2004 hit 'Absolution,' again produced by Rich Costey."),
        Album(image: Images.nightwish, title: "Once", artist: "Nightwish", year: "2004", description: "Fifth album. It is the last studio album to feature Tarja Turunen as the main vocalist."),
        Album(image: Images.rammstein, title: "Reise, Reise", artist: "Rammstein", year: "2004", description: "The album charted in the top ten in several European charts and was a number one hit in Germany, Austria, Switzerland, Iceland, Finland, Estonia and Mexico."),
        Album(image: Images.rhcp, title: "Stadium Arcadium", artist: "Red Hot Chili Peppers", year: "2006", description: "Rick Rubin produced this double-disc, 28-song set for the veteran Los Angeles rock outfit."),
        Album(image: Images.yeah, title: "It's Blitz", artist: "Yeah Yeah Yeahs", year: "2009", description: "The third album for the New York band was produced by Nick Launay and Dave Sitek.")
    ].sorted(by: {$0.title < $1.title})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemTeal
        
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if (indexPath.row%2 == 0) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.darkGray
        }
        cell.textLabel?.textColor = UIColor.white
        cell.imageView?.image = myList[indexPath.row].image
        cell.textLabel?.text = myList[indexPath.row].artist
        
        return cell
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = InfoViewController()
        controller.myObject = myList[indexPath.row]
        self.performSegue(withIdentifier: "mySegue", sender: indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? InfoViewController{
            let selectedRow = sender as? Int
            if myList[selectedRow!] != nil {
                destination.myObject = myList[selectedRow!]
            }
        }
    }
    
}
