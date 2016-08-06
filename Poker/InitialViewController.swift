//
//  InitialViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/4/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

var numPlayers : Int = 0
var players : [Player] = []

class InitialViewController: UIViewController {
    
    @IBOutlet weak var numPlayersField: UITextField!
    
    var didEnterNum : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func okButtonTapped(sender: UIButton) {
        var toContinue = false
        if let tmpPlayers = Int(numPlayersField.text!){
            if tmpPlayers >= 2 && tmpPlayers <= 6{
                numPlayers = tmpPlayers
                toContinue = true
            }
        }
        if toContinue == true{
            self.performSegueWithIdentifier("PlayersToNames", sender: self)
        }
    }
    
}

