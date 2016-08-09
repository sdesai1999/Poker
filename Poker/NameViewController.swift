//
//  NameViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/6/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITextFieldDelegate {

    var nameFields : [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(NameViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        for i in 0..<numPlayers{
            let nameField = UITextField(frame: CGRectMake(self.view.frame.width / 2 - 117, 36.5 * CGFloat(i) + 150, 234, 30))
            nameField.placeholder = "Player \(i+1)'s Name"
            nameField.font = UIFont.systemFontOfSize(15)
            nameField.borderStyle = UITextBorderStyle.RoundedRect
            nameField.autocorrectionType = UITextAutocorrectionType.Yes
            nameField.keyboardType = UIKeyboardType.Default
            nameField.returnKeyType = UIReturnKeyType.Done
            nameField.clearButtonMode = UITextFieldViewMode.WhileEditing
            nameField.textAlignment = .Center
            nameField.tag = i
            nameField.delegate = self
            self.view.addSubview(nameField)
            nameFields.append(nameField)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func createPlayer(tmpName : String){
        let player = Player()
        player.name = tmpName
        player.myMoney = 100
        players.append(player)
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func playPoker(sender: UIButton) {
        for i in 0..<numPlayers{
            createPlayer(nameFields[i].text!)
        }
        self.performSegueWithIdentifier("exitNamesVC", sender: self)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
