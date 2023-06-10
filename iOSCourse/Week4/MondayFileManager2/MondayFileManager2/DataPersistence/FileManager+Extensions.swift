//
//  FileManager+Extensions.swift
//  MondayFileManager2
//
//  Created by Admin on 12/5/21.
//

import Foundation

extension FileManager {
    //function gets URL path to documents directory
    //FileManager.getDocumentsDirectory() // type method
    // let fileManager = FileManager()
    //fileManager.getDocumentsDirectory() instance method
    
    //documents/
    static func getDocumentsDirectory()-> URL {
        //function accesses an array of urls but we only want access to a single file not the entire array
        //userDomainMask returns current user's document folder
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    //documents/schedules.plist "schedules.plist"
    static func pathToDocumentsDirectory(with filename:String)-> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
