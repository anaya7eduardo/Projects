//
//  ScheduleListController.swift
//  MondayFileManager2
//
//  Created by Admin on 12/5/21.
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
            
            //toggle bar button title between "Edit" & "Done"
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }
    /*
     The word ‘lazy’ describes best what a lazy property means as the initial value of a lazy property is not calculated until the first time it’s used. In other words: It’s lazy initialization. This could be a great way to optimize your code to prevent doing any unnecessary work
     https://stevenpcurtis.medium.com/the-lazy-variables-what-and-why-in-swift-619cb951ee0f
     https://www.avanderlee.com/swift/lazy-var-property/
     */
    lazy var dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d, yyyy, hh:mm a"
        formatter.timeZone = .current
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
//        setupTableView()
        tableview.dataSource = self
        //print path to documents directory
        print(FileManager.getDocumentsDirectory())
    }
    
    func setupTableView() {
//        events = Event.getTestData().sorted { $0.date < $1.date }
        tableview.dataSource = self
    }
    private func loadEvents() {
        do {
            events = try PersistenceHelper.loadEvents().sorted { $0.date < $1.date }
        } catch {
            print("error loading events: \(error)")
        }
    }
    
    private func deleteEvent(indexPath: IndexPath) {
        do {
            try PersistenceHelper.delete(event: indexPath.row)
        } catch {
            print("error deleting event: \(error)")
        }
    }

    @IBAction func addNewEvent(_ segue: UIStoryboardSegue) {
       //get reference to the CreateEventController instance
        guard let createEventController = segue.source as? CreateEventController, let createdEvent = createEventController.event else {
            fatalError("failed to access CreateEventController")
        }
        //persist (save) event to documents directory
        do {
            //creating a new event
            try PersistenceHelper.create(event: createdEvent)
        } catch {
            print("error saving event: \(error)")
        }
        
        //insert new saved event to our events array
        events.append(createdEvent)
        
        //create an indexPath to be inserted into the tableview
        let indexPath = IndexPath(row: events.count - 1, section: 0) //will represent top of tableview
        //2 now we need to update the tableview
        //use indexPath to insert new row into the tableview
        tableview.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        //change bool value of var
        isEditingTableView.toggle()
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
    
    //MARK: -delete rows from tableview
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            //only called if "insertion control" exists and gets selected
            print("inserting...")
        case .delete:
            print("deleting...")
            //1 remove event from data model in this case events
            events.remove(at: indexPath.row) //removed from array
            
            deleteEvent(indexPath: indexPath)
            
            //2 update the tableview
            tableview.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
    //MARK: reordering rows in tableview
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movingEvent = events[sourceIndexPath.row] //save event being moved
        events.remove(at: sourceIndexPath.row)
        events.insert(movingEvent, at: destinationIndexPath.row)
        
        //update and resave altered array in documents directory
        PersistenceHelper.reorderEvents(events: events)
        do {
            events = try PersistenceHelper.loadEvents()
            tableview.reloadData()
    
        } catch {
            print("error loading events: \(error)")
        }
    }
    
}
