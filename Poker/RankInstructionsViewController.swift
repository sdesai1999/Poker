//
//  RankInstructionsViewController.swift
//  Poker
//
//  Created by Saurav Desai on 8/5/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class RankInstructionsViewController: UIViewController {

    @IBOutlet weak var handRanking: UILabel!
    var handRanks : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        handRanks = "• No Pair: The lowest possible hand, five cards with no matching values.\n"
        handRanks += "• One Pair: Two cards of the same value (i.e. 2 Aces).\n"
        handRanks += "• Two Pair: Two sets of pairs (i.e. 2 Aces and 2 9s).\n"
        handRanks += "• Three of a Kind: Three cards of the same value (i.e. 3 Aces).\n"
        handRanks += "• Straight: Five cards with consecutive values (i.e. an Ace, 2, 3, 4, and 5).\n"
        handRanks += "• Flush: Five cards of the same suit (i.e. 5 cards that are Diamonds).\n"
        handRanks += "• Full House: A Three of a Kind and a One Pair (i.e. 3 Aces and 2 8s).\n"
        handRanks += "• Four of a Kind: Four cards of the same value (i.e. 4 Queens).\n"
        handRanks += "• Straight Flush: A Straight and a Flush (i.e. 5 Diamonds and a 4, 5, 6, 7, and 8).\n"
        handRanks += "• Royal Flush: The highest possible hand, 5 cards of the same suit and a 10, Jack, Queen, King, and Ace.\n"
        handRanking.text = handRanks
    }

}
