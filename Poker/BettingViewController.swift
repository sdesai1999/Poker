//
//  BettingViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/6/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class BettingViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<numPlayers{
            let bettingField = UITextField(frame: CGRectMake(self.view.frame.width / 2 - 117, 36.5 * CGFloat(i) + 150, 234, 30))
            bettingField.placeholder = "\(players[i].name)'s Bet ($\(players[i].myMoney) left)"
            bettingField.font = UIFont.systemFontOfSize(15)
            bettingField.borderStyle = UITextBorderStyle.RoundedRect
            bettingField.autocorrectionType = UITextAutocorrectionType.No
            bettingField.keyboardType = UIKeyboardType.NumberPad
            bettingField.returnKeyType = UIReturnKeyType.Done
            bettingField.clearButtonMode = UITextFieldViewMode.WhileEditing
            bettingField.textAlignment = .Center
            bettingField.tag = i
            bettingField.delegate = self
            self.view.addSubview(bettingField)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
