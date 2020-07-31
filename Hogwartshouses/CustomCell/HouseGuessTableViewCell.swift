//
//  HouseGuessTableViewCell.swift
//  Hogwartshouses
//
//  Created by Colton Swapp on 7/30/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class HouseGuessTableViewCell: UITableViewCell {
    
    var guess: HouseGuess? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var personGuessLabel: UILabel!
    @IBOutlet weak var houseImageButton: UIButton!
    
    
    // MARK: - Properties

    // MARK: - Actions
    @IBOutlet weak var houseButtonTapped: UIButton!
    
    
    // MARK: - Helpers
    
    func updateViews() {
        guard let guess = guess else { return }
        personGuessLabel.text = guess.guessName
        
    }
}
