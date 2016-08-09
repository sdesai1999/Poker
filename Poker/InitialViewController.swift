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
var pot : Int = 0
var roundCount : Int = 0
var deck = Deck()
var playerTurn : Int = 0

class InitialViewController: UIViewController {
    
    @IBOutlet weak var numPlayersField: UITextField!
    
    var didEnterNum : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(InitialViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        numPlayersField.clearButtonMode = UITextFieldViewMode.WhileEditing
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
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}

