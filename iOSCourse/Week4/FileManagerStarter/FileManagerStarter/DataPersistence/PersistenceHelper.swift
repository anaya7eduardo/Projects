//
//  PersistenceHelper.swift
//  FileManagerStarter
//
//  Created by Eduardo Anaya on 12/7/21.
//

import Foundation
/*
 enums can also store associated values attached to each case. This lets you attach additional information to your enums so that can represent more nuanced data
 https://www.programiz.com/swift-programming/associated-value-enum
 https://sarunw.com/posts/lesser-known-ways-of-using-swift-enums/
 */
enum DataPersistenceError: Error {
    case saveError(Error) //Marking Error as the Associated Value
    case fileNotExistant(String)
    case noData
    case decodingError(Error)
    case deletingError(Error)
}

class PersistenceHelper {
    //CRUD - Create, Read, Update, Delete
    
    private static var events = [Event]()
    
    private static let filename = "schedules.plist"
    
    private static func save() throws {
        //1
        //Get url path to the file that the event will be saved to
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        //Events array will be object being converted to Data
        //We will use the Data object and write (save) it to documents directory
        do {
            //3.
            //Converting (serializing) the events array to data
            let data = try PropertyListEncoder().encode(events)
            //4.
            //
            try data.write(to: url, options: .atomic)
            
        } catch {
            throw DataPersistenceError.saveError(error)
        }
    }
    
    //For reordering
    public static func reorderEvents(events: [Event]) {
        self.events = events
        try? save()
    }
     
    //Create -save item to documents directory
    static func create(event:Event) throws {
        //2.
        //Append new event to the events array
        events.append(event)
        
        do {
            try save()
        } catch {
            throw DataPersistenceError.saveError(error)
        }
    }
    
    //Read -load (retrieve) items from documents directory
    static func loadEvents() throws -> [Event] {
        //We need access to the filename URL that we are reading from
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        //check if file exists
        //to convert URL to String we use .path on the URL
        if FileManager.default.fileExists(atPath: url.path) {
            if let data = FileManager.default.contents(atPath: url.path) {
                do {
                    events = try PropertyListDecoder().decode([Event].self, from: data)
                } catch {
                    throw DataPersistenceError.decodingError(error)
                }
            } else {
                throw DataPersistenceError.noData
            }
        }
        else {
            throw DataPersistenceError.fileNotExistant(filename)
        }
        return events
    }
    
    //Update
    
    //Delete - remove item from documents directory
    static func delete(event index:Int) throws {
        //remove the item from the events array
        events.remove(at: index)
        
        //save our events array to the documents directory
        do {
            try save()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
}
