//
//  UsersStore.swift
//  Data
//
//  Created by hagi on 08/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

import Foundation
import CoreData

class UsersStore {
    
    static let sharedInstance = UsersStore()
    private init() {}
    
    func createUser(#username: String, password: String) -> User? {
        if let context = dataStack.managedObjectContext,
            user = NSEntityDescription.insertNewObjectForEntityForName(User.entityName, inManagedObjectContext: context) as? User {
            
            user.username = username
            user.password = password
                
            return user
        }
        
        return nil
    }
    
    
    func fetchUsers(username: String) -> (success: Bool, objects: [User], error: NSError?) {
        let request = NSFetchRequest(entityName: User.entityName)

        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", username)
        
        var error: NSError? = nil
        let results = dataStack.managedObjectContext?.executeFetchRequest(request, error: &error)
        
        return error == nil ? (true, results as! [User], nil) : (false, [], error)
    }
}

let usersStore = UsersStore.sharedInstance

