//
//  Event.swift
//  FileManagerStarter
//
//  Created by Eduardo Anaya on 12/7/21.
//

import Foundation

struct Event: Codable {
    var date: Date
    var name: String
    
    static func getTestData() -> [Event] {
        let eventNames = ["breakfast at Tiffany's", "Concert", "iOS homework", "Watch the game", "Take a walk", "Dinner"]
        var events = [Event]()
        for eventName in eventNames {
            let event = Event (date: Date(), name: eventName)
            events.append(event)
        }
        return events
    }
}
