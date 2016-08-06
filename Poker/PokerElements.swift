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
    var suit:Int = -1
    var value:Int = -1
    var suitStr:String = "NaN"
    var valueStr:String = "NaN"
    var cardName:String = "NaN"
}

class Deck{
    var cards = [Card]()
}

class Player{
    var name:String = ""
    var hand = [Card]()
    var handRank:String = ""
    var myMoney:Int = 0
}

class Dealer{
    var players = [Player]()
    var dealersMoney = 0
}