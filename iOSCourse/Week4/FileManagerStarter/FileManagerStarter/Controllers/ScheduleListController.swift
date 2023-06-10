//
//  ViewController.swift
//  FileManagerStarter
//
//  Created by Admin on 12/7/21.
//

import UIKit

class ScheduleListController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var events = [Event]()
    
    var isEditingTableView = false {
        didSet {
            //property observer
            //toggles editing mode of tableview
            tableview.isEditing = isEditingTableView
            
            //toggle bar button item between "edit" & "done"
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }
    /*
     The word 'lazy' describess best what a lazy property means as teh initial value of a lazy property is not calculated until the first time it's used. In other words: It's a lazy initialization. This could be a great way to optimize your code to prevent doing any unnecesary work
     https://stevenpcurtis.medium.com/the-lazy-variable-what-and-why-in-swift-619cb951ee0f
     https://www.avenderlee.com/swift/lazy-var-property/
     */
    lazy var dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM, d, yyyy, hh:mm a"
        formatter.timeZone = .current
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
        tableview.dataSource = self
        //print path to documents directory
        print(FileManager.getDocumentsDirectory())
        events = Event.getTestData().sorted { $0.date < $1.date }
    }
    
    private func loadEvents() {
        do {
            events = try PersistenceHelper.loadEvents().sorted { $0.date < $1.date }
        } catch {
            print("Error Loading Events \(error)")
        }
    }

    private func deleteEvent(indexPath: IndexPath) {
        do {
            try PersistenceHelper.delete(event: indexPath.row)
        } catch {
            print("Error Deleting Event: \(error)")
        }
        
    }
    
    @IBAction func addEvent(_ segue: UIStoryboardSegue) {
        //get reference to the CreateEventController instance
        guard let createEventController = segue.source as? CreateEventController, let createdEvent = createEventController.event else {
            fatalError("Failed to access CreateEventController")
        }
        //persist (save) event to documents directory
        do {
            //adds event at top of array
            try PersistenceHelper.create(event: createdEvent)
        } catch {
            print("Error Saving Event With Error: \(error)")
        }
        
        //insert new event into our events array
        events.append(createdEvent)
        
        //create and indexPath to be inserted into the tableview
        //will represent top of tableview
        let indexPath = IndexPath(row: events.count - 1, section: 0)
        
        //we need to update the tableview
        //
        tableview.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func editEvent(_ sender: Any) {
        isEditingTableView.toggle() //changes the bool value
    }
    
    
}

extension ScheduleListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = dateFormatter.string(from: event.date)
        return cell
    }
    
    //MARK: - deleting rows in tableview
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            //only gets called in 'insertion control' exists and gets selected
            print("inserting")
        case .delete:
            print("deleting")
            //remove item from the data model [Event]
            events.remove(at: indexPath.row)
            
            //removing event from events array
            deleteEvent(indexPath: indexPath)
            
            //now we need to update the tableview after deleting event
            tableview.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //event being moved
        let eventToMove = events[sourceIndexPath.row]
        events.remove(at: sourceIndexPath.row)
        events.insert(eventToMove, at: destinationIndexPath.row)
        
        //re-save array in documents directory
        PersistenceHelper.reorderEvents(events: events)
        do {
            events = try PersistenceHelper.loadEvents()
            tableView.reloadData()
        } catch {
            print("Error Loading Events: \(error)")
        }
    }
    
}
