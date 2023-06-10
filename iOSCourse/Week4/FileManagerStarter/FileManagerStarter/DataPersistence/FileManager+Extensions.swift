//
//  FileManager+Extensions.swift
//  FileManagerStarter
//
//  Created by Eduardo Anaya on 12/7/21.
//

import Foundation

extension FileManager {
    /*
     Function get URL Path to Documents Directory
     Filemanager.getDocumentsDirectory() //type method
     let fileManager = FileManager()
     fileManager.getDocuments //
     */
    static func getDocumentsDirectory()-> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    //documents/schedules.plist "schedule.plist"
    static func pathToDocumentsDirectory(with filename:String)-> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
