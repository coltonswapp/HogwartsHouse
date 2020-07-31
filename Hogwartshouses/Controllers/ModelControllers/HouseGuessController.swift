//
//  HouseGuessController.swift
//  Hogwartshouses
//
//  Created by Colton Swapp on 7/30/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
import CoreData

class HouseGuessController {
    
    // MARK: - SharedInstance
    static let sharedInstance = HouseGuessController()
    
    // MARK: - Source of Truth
    let fetchedResultsController: NSFetchedResultsController<HouseGuess> = {
        
        let fetchRequest: NSFetchRequest<HouseGuess> = HouseGuess.fetchRequest()
        let veiledSort = NSSortDescriptor(key: "isVisible", ascending: false)
        
        fetchRequest.sortDescriptors = [veiledSort]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isVisible", cacheName: nil)
        
    }()
    
    init() {
        do{
            try fetchedResultsController.performFetch()
        } catch {
            print("Error fetching the data.")
        }
    }
    
    // MARK: - Crud Funcs!!
    
    func createGuess(name: String, house: String) {
        _ = HouseGuess(guessName: name, house: house)
        
        // Save
    }
    
    func updateVisibility(houseGuess: HouseGuess) {
        houseGuess.isVisible = !houseGuess.isVisible
        // Save
    }
    
    func remove(houseGuess: HouseGuess) {
        let moc = CoreDataStack.context
        moc.delete(houseGuess)
        
        // Save
    }
    
    
    // MARK: - Persistence
    func saveToPersistence() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving to persistence")
        }
    }
}
