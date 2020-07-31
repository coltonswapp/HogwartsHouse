//
//  MainTableViewController.swift
//  Hogwartshouses
//
//  Created by Colton Swapp on 7/30/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    // MARK: - Action
    @IBAction func addButtonTapped(_ sender: Any) {
        presentAlertController()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return HouseGuessController.sharedInstance.fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return HouseGuessController.sharedInstance.fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "guessCell", for: indexPath) as? HouseGuessTableViewCell else { return UITableViewCell()}

        let guessToDisplay = HouseGuessController.sharedInstance.fetchedResultsController.object(at: indexPath)
        
        cell.guess = guessToDisplay
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let guessToDelete = HouseGuessController.sharedInstance.fetchedResultsController.object(at: indexPath)
            HouseGuessController.sharedInstance.remove(houseGuess: guessToDelete)

        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HouseGuessController.sharedInstance.fetchedResultsController.sectionIndexTitles[section]
            == "0" ? "Invisibility Cloak" : "Visible"
    }
    
    // MARK: - Helper
    func presentAlertController() {
        let alertController = UIAlertController(title: "Add House Guess", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Person's name..."
        }
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Person's Hogwarts House guess"
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addGuessAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let guessName = alertController.textFields?[0].text, !guessName.isEmpty, let house = alertController.textFields?[1].text, !house.isEmpty else { return }
            
            HouseGuessController.sharedInstance.createGuess(name: guessName, house: house)
        }
        alertController.addAction(cancelButton)
        alertController.addAction(addGuessAction)
        
        present(alertController, animated: true)
    }
    
} // End of class
