//
//  PokerElements.swift
//  Poker
//
//  Created by Saurav Desai on 8/5/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import Foundation
import UIKit

class Card{
    var suit : Int = -1
    var value : Int = -1
    var image = UIImage()
}

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

class Player{
    var name : String = ""
    var hand = [Card]()
    var handRank : String = ""
    var myMoney : Int = 0
    var amountToBet : Int = 0
    
    func sortHand(){ // selection sort to sort the player's hand by value
        var pos = -1
        let n = hand.count
        for j in 0..<(n-1){
            pos = j
            for k in (j+1)..<n{
                if hand[k].value < hand[pos].value{
                    pos = k
                }
            }
            let temp = hand[j]
            hand[j] = hand[pos]
            hand[pos] = temp
        }
    }
}

/*
class Dealer{
    var players = [Player]()
    var dealersMoney = 0
}
*/

extension Array{
    // randomizes the elements in an array
    mutating func shuffle(){
        for _ in 0..<10{
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}