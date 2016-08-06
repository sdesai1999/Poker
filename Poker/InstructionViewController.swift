//
//  InstructionViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/5/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var instructionLabel: UILabel!
    var instructions : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructions = "Everyone starts with $100, and you will each bet money before the round starts. "
        instructions += "You will then be dealt 5 cards each. You will be able to reject up to 3 cards. "
        instructions += "The winner of the round will be determined by how your hand ranks. "
        instructions += "Ties will be broken by whoever has the highest card that applies to that rank."
    }

}
