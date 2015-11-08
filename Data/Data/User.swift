//
//  User.swift
//  Data
//
//  Created by hagi on 08/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {

    static let entityName = "User"
    
    @NSManaged var username: String
    @NSManaged var password: String
}
