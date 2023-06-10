//
//  Event.swift
//  MondayFileManager2
//
//  Created by Admin on 12/5/21.
//

import Foundation

struct Event: Codable {
    var date: Date
    var name: String
    
    static func getTestData() -> [Event] {
        let eventNames = ["Monday Lesson", "Lunch with friends", "Watch the game", "Taco Tuesday", "Date Night", "Friday Night Movie", "Hiking at state park", "Take dog to vet", "Gaming Night", "Grocery shopping"]
        var events = [Event]()
        for eventName in eventNames {
            let event = Event(date: Date(), name: eventName)
            events.append(event)
        }
        return events
    }
}
