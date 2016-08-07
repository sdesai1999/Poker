//
//  GameViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/7/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet var cardImageViews: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundLabel.text = "Round \(roundCount)"
        playerTurnLabel.text = "\(players[0].name)'s Turn"
        deck.shuffleDeck()
        dealCards()
    }
    
    func dealCards(){
        for _ in 0..<5{
            for j in 0..<numPlayers{
                players[j].hand.append(deck.cards[0])
                deck.cards.removeAtIndex(0)
            }
        }
        //deal cards in an orderly fashion
    }
    
    func displayCards(num : Int){
        for i in 0..<5{
            cardImageViews[i].image = players[num].hand[i].image
        }
    }

}
