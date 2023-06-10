//
//  User.swift
//  WedCD
//
//  Created by Admin on 12/7/21.
//

import Foundation
import CoreData

public class User:NSManagedObject {
    @NSManaged var name: String
    @NSManaged var age: Int16
    @NSManaged var createdDate: Date
}
