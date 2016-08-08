//
//  Deck.swift
//  Poker
//
//  Created by Saurav Desai on 8/8/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import Foundation
import UIKit

class Deck{
    var cards = [Card]()
    
    func newDeck(){
        cards.removeAll()
        for i in 1..<5{ // 1 to 4
            for j in 1..<14{ // 1 to 13
                let card = Card()
                card.suit = i
                card.value = j
                switch i { // for setting the card's image property
                case 1:
                    var cardImage = UIImage()
                    cardImage = UIImage(named: "clubs\(card.value)")!
                    card.image = cardImage
                case 2:
                    var cardImage = UIImage()
                    cardImage = UIImage(named: "diamonds\(card.value)")!
                    card.image = cardImage
                case 3:
                    var cardImage = UIImage()
                    cardImage = UIImage(named: "hearts\(card.value)")!
                    card.image = cardImage
                case 4:
                    var cardImage = UIImage()
                    cardImage = UIImage(named: "spades\(card.value)")!
                    card.image = cardImage
                default:
                    break
                }
                deck.cards.append(card)
            }
        }
    }
    
    func shuffleDeck(){
        cards.shuffle()
    }
}

extension Array{
    // randomizes the elements in an array
    mutating func shuffle(){
        for _ in 0..<10{
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}