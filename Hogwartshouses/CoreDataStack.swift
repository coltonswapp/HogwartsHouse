//
//  CoreDataStack.swift
//  Hogwartshouses
//
//  Created by Colton Swapp on 7/30/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Hogwartshouses")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext}
}
