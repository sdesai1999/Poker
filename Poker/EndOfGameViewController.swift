//
//  EndOfGameViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/10/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class EndOfGameViewController: UIViewController {

    @IBOutlet weak var gameInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.determineGameWinner()
    }
    
    func determineGameWinner(){
        var playersMoney = [Int]()
        for i in 0..<numPlayers{
            playersMoney.append(players[i].money)
        }
        var maxMoney = -1
        for i in 0..<numPlayers{
            if players[i].money > maxMoney{
                maxMoney = players[i].money
            }
        }
        var maxMoneyCount = 0
        var winnerList = [Int]()
        for i in 0..<numPlayers{
            if players[i].money == maxMoney{
                maxMoneyCount += 1
                winnerList.append(i)
            }
        }
        if maxMoneyCount > 1{ // ties
            var stringToDisplay = "There are multiple winners in this game of poker with $\(maxMoney): "
            for i in 0..<winnerList.count{
                if i == winnerList.count-1{
                    stringToDisplay += "\(players[winnerList[i]].name)."
                    break
                }
                stringToDisplay += "\(players[winnerList[i]].name), "
            }
            gameInfoLabel.text = stringToDisplay
        }
        else{ // no ties
            gameInfoLabel.text = "The winner of this game of poker is \(players[winnerList[0]].name) with $\(maxMoney)."
        }
        
    }

    @IBAction func newGameTapped(sender: UIButton) {
        
    }
}
