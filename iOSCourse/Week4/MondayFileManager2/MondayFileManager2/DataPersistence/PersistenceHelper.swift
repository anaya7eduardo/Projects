//
//  PersistenceHelper.swift
//  MondayFileManager2
//
//  Created by Admin on 12/5/21.
//

import Foundation
/*
 enums can also store associated values attached to each case. This lets you attach additional information to your enums so they can represent more nuanced data
 https://www.programiz.com/swift-programming/associated-value-enum
 https://sarunw.com/posts/lesser-known-ways-of-using-swift-enums/
 */
enum DataPersistenceError:Error {
    case saveError(Error) //marking Error as the associated value
    case fileNotExistant(String)
    case noData
    case decodingError(Error)
    case deletingError(Error)
}
//
//class PersistenceHelper {
//    //CRUD - create, read, update, delete
//    private static var events = [Event]()
//
//    private static let filename = "schedules.plist"
//
//    private static func save() throws {
//        //step 1
//        //get url path to the file that the event will be saved to
//        let url = FileManager.pathToDocumentsDirectory(with: filename)
//
//        /*
//         events array will be the object being converted to Data
//         we will use that Data object and write (save) it to the documents directory
//         */
//
//        do {
//            //step 3
//            //convert aka serialize the events array to Data
//            let data = try PropertyListEncoder().encode(events)
//
//            //step 4
//            //write, save, persist the data to documents directory
//            /*
//             In Objective-C the implementation of an atomic property allows properties to be safely read and written from different threads. Atomic is only thread-safe with simple use
//             */
//            try data.write(to: url, options: .atomic)
//        } catch {
//            //step 5
//            throw DataPersistenceError.saveError(error)
//        }
//    }
//    //for reordering
//    public static func reorderEvents(events: [Event]) {
//        self.events = events
//            try? save()
//    }
//    //create-save item to documents directory
//    static func create(event: Event) throws {
//        //step 2
//        //append new event to the events array
//        events.append(event)
//
//        do {
//            try save()
//        } catch {
//            throw DataPersistenceError.saveError(error)
//        }
//    }
//    //read-load (retrieve) items from documents directory
//    static func loadEvents() throws -> [Event] {
//        //we need to access the filename URL we are reading from
//        let url = FileManager.pathToDocumentsDirectory(with: filename)
//        //check if file exists
//        //convert url -> string we use .path on url
//        if FileManager.default.fileExists(atPath: url.path) {
//            if let data = FileManager.default.contents(atPath: url.path) {
//                do {
//                    events = try PropertyListDecoder().decode([Event].self, from: data)
//                } catch {
//                    throw DataPersistenceError.decodingError(error)
//                }
//            } else {
//                throw DataPersistenceError.noData
//            }
//        }
//        else {
//            throw DataPersistenceError.fileNotExistant(filename)
//        }
//        return events
//    }
//
//    //update -
//
//    //delete - remove items from documents directory
//    static func delete(event index:Int) throws {
//        //remove item from events array
//        events.remove(at: index)
//        //save our events array to the documents directory
//        do {
//            try save()
//        } catch {
//            throw DataPersistenceError.deletingError(error)
//        }
//    }
//}

 class PersistenceHelper {
   
   // CRUD - create, read, update, delete
   
   // array of events
   private static var events = [Event]()
   
   private static let filename = "schedules.plist"
   
   private static func save() throws {
     // step 1.
      // get url path to the file that the Event will be saved to
      let url = FileManager.pathToDocumentsDirectory(with: filename)
     
     // events array will be object being converted to Data
     // we will use the Data object and write (save) it to documents directory
     do {
       // step 3.
       // convert (serialize) the events array to Data
       let data = try PropertyListEncoder().encode(events)
 /*
  In Objective-C the implementation of an atomic property allows properties to be safely read and written from different threads. Atomic is only thread-safe with simple use
  */

       // step 4.
       // writes, saves, persist the data to the documents directory
       try data.write(to: url, options: .atomic)
     } catch {
       // step 5.
       throw DataPersistenceError.saveError(error)
     }
   }
   
   // for re-ordering
   public static func reorderEvents(events: [Event]) {
     self.events = events
     try? save()
   }
   
   // DRY - don't repeat yourself
   
   // create - save item to documents directory
   static func create(event: Event) throws {
     // step 2.
     // append new event to the events array
     events.append(event)
     
     do {
       try save()
     } catch {
       throw DataPersistenceError.saveError(error)
     }
   }

   // read - load (retrieve) items from documents directory
   static func loadEvents() throws -> [Event] {
     // we need access to the filename URL that we are reading from
     let url = FileManager.pathToDocumentsDirectory(with: filename)
     
     // check if file exist
     // to convert URL to String we use .path on the URL
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
   
   // update -
   
   // delete - remove item from documents directory
   static func delete(event index: Int) throws {
     // remove the item from the events array
     events.remove(at: index)
     
     // save our events array to the documents directory
     do {
       try save()
     } catch {
       throw DataPersistenceError.deletingError(error)
     }
   }
 }


