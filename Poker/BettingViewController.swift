//
//  BettingViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/6/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class BettingViewController: UIViewController, UITextFieldDelegate {

    var bettingFields : [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(BettingViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        for i in 0..<numPlayers{
            let bettingField = UITextField(frame: CGRectMake(self.view.frame.width / 2 - 117, 36.5 * CGFloat(i) + 150, 234, 30))
            bettingField.placeholder = "\(players[i].name)'s Bet ($\(players[i].myMoney) left)"
            bettingField.font = UIFont.systemFontOfSize(15)
            bettingField.borderStyle = UITextBorderStyle.RoundedRect
            bettingField.autocorrectionType = UITextAutocorrectionType.No
            bettingField.keyboardType = UIKeyboardType.NumberPad
            bettingField.clearButtonMode = UITextFieldViewMode.WhileEditing
            bettingField.textAlignment = .Center
            bettingField.tag = i
            bettingField.delegate = self
            bettingFields.append(bettingField)
            self.view.addSubview(bettingField)
        }
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func nextButton(sender: UIButton) {
        var safeToContinue = true
        for i in 0..<numPlayers{
            if let tmpToBet = Int(bettingFields[i].text!){
                if tmpToBet > 0 && tmpToBet <= players[i].myMoney{
                    players[i].amountToBet = tmpToBet
                }
                else{
                    safeToContinue = false
                }
            }
            else{
                safeToContinue = false
            }
        }
        if safeToContinue == true{
            self.performSegueWithIdentifier("exitBettingVC", sender: self)
        }
    }
}
