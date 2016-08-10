//
//  EndOfRoundViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/9/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class EndOfRoundViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addPlayerOutlet: UIButton!
    @IBOutlet weak var removePlayerOutlet: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    var kickedPlayers : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Round \(roundCount) Finished"
        infoLabel.text = ""
        self.kickPlayers()
        self.checkForPlayerLimit()
        self.checkForPlayerMin()
        self.setNextButtonOutletTitle()
    }
    
    func setNextButtonOutletTitle(){
        if numPlayers == 1{
            nextButtonOutlet.setTitle("New Game", forState: .Normal)
        }
        else{
            nextButtonOutlet.setTitle("Next", forState: .Normal)
        }
    }
    
    func kickPlayers(){
        var i = 0
        while i < numPlayers{
            if players[i].money == 0{
                kickedPlayers.append(players[i].name)
                players.removeAtIndex(i)
                numPlayers = players.count
                i -= 1
            }
            i += 1
        }
        if kickedPlayers.count == 1{
            infoLabel.text = "\(kickedPlayers[i]) was kicked from this game because of insufficient money."
        }
        else if kickedPlayers.count > 1{
            var stringToAdd = "Players kicked: "
            for k in 0..<kickedPlayers.count{
                if k == kickedPlayers.count-1{
                    stringToAdd += "\(kickedPlayers[k]). "
                    break
                }
                stringToAdd += "\(kickedPlayers[k]), "
            }
            stringToAdd += "They were kicked because of insuffiecient money."
            infoLabel.text = stringToAdd
        }
        else{
            infoLabel.text = ""
        }
    }
    
    func checkForPlayerLimit(){
        if numPlayers == 6{
            addPlayerOutlet.hidden = true
        }
        else{
            addPlayerOutlet.hidden = false
        }
    }
    
    func checkForPlayerMin(){
        if numPlayers == 1{
            removePlayerOutlet.hidden = true
        }
        else{
            removePlayerOutlet.hidden = false
        }
    }

    @IBAction func addPlayerTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Add Player", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.textAlignment = .Center
            textField.placeholder = "Player Name"
            textField.clearButtonMode = UITextFieldViewMode.WhileEditing
            textField.keyboardType = UIKeyboardType.Default
            textField.autocorrectionType = UITextAutocorrectionType.Yes
            textField.returnKeyType = UIReturnKeyType.Done
            textField.autocapitalizationType = UITextAutocapitalizationType.Sentences
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) in
            let player = Player()
            player.money = 100
            let nameTextField = alert.textFields![0] as UITextField
            player.name = nameTextField.text!
            players.append(player)
            numPlayers += 1
            self.checkForPlayerLimit()
            self.checkForPlayerMin()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func removePlayerTapped(sender: UIButton) {
        let actionController = UIAlertController(title: "Select someone to remove.", message: nil, preferredStyle: .ActionSheet)
        for i in 0..<numPlayers{
            let removeAction = UIAlertAction(title: "\(players[i].name)", style: .Default) { (action) in
                var k = 0
                while k < numPlayers{
                    if players[i].name == players[k].name && i == k{
                        players.removeAtIndex(k)
                        k -= 1
                        numPlayers = players.count
                        self.checkForPlayerLimit()
                        self.checkForPlayerMin()
                        self.setNextButtonOutletTitle()
                        break
                    }
                    k += 1
                }
            }
            actionController.addAction(removeAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        actionController.addAction(cancelAction)
        self.presentViewController(actionController, animated: true, completion: nil)
    }
    
    @IBAction func finishGameTapped(sender: UIButton) {
        self.performSegueWithIdentifier("GameFinished", sender: self)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
