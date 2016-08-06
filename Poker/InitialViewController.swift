//
//  InitialViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/4/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

var numPlayers : Int = 0

class InitialViewController: UIViewController {

    @IBOutlet weak var numPlayersField: UITextField!
    @IBOutlet weak var playerNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameField.hidden = true
    }

    @IBAction func okButtonTapped(sender: UIButton) {
        var toContinue = false
        if let tmpPlayers = Int(numPlayersField.text!){
            if tmpPlayers >= 2 || tmpPlayers <= 6{
                numPlayers = tmpPlayers
                toContinue = true
            }
        }
        if toContinue == true{
            playerNameField.hidden = false
            
        }
    }
}

