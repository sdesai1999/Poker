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
    @IBOutlet weak var flipButtonOutlet: UIButton!
    @IBOutlet var cardImageViews: [UIImageView]!
    @IBOutlet weak var rejectCardsView: UIView!
    @IBOutlet weak var rejectCardsLabel: UILabel!
    @IBOutlet weak var yesButtonOutlet: UIButton!
    @IBOutlet weak var noButtonOutlet: UIButton!
    @IBOutlet weak var rejectButtonOutlet: UIButton!
    @IBOutlet var cardUIViews: [UIView]!
    
    var numTapped : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rejectCardsView.hidden = true
        deck.shuffleDeck()
        dealCards()
        setUpVC(playerTurn)
        for imageView in cardImageViews{
            imageView.userInteractionEnabled = true
        }
        let tapRecognizer0 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card0Tapped))
        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card1Tapped))
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card2Tapped))
        let tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card3Tapped))
        let tapRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card4Tapped))
        cardImageViews[0].addGestureRecognizer(tapRecognizer0)
        cardImageViews[1].addGestureRecognizer(tapRecognizer1)
        cardImageViews[2].addGestureRecognizer(tapRecognizer2)
        cardImageViews[3].addGestureRecognizer(tapRecognizer3)
        cardImageViews[4].addGestureRecognizer(tapRecognizer4)
        
    }
    
    func card0Tapped(){
        if cardUIViews[0].backgroundColor = UIColor.greenColor(){
            
        }
    }
    
    func card1Tapped(){
        
    }
    
    func card2Tapped(){
        
    }
    
    func card3Tapped(){
        
    }
    
    func card4Tapped(){
        
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
    
    func displayBacks(){
        for i in 0..<5{
            cardImageViews[i].image = UIImage(named: "BackOfACard")
        }
    }
    
    func setUpVC(num : Int){
        roundLabel.text = "Round \(roundCount)"
        playerTurnLabel.text = "\(players[num].name)'s Turn"
        displayBacks()
    }
    
    func rejectCards(num : Int){
        
    }
    
    @IBAction func flipAndShowCards(sender: UIButton) {
        displayCards(playerTurn)
        flipButtonOutlet.hidden = true
        players[playerTurn].sortHand()
        rejectCardsView.hidden = false
        rejectButtonOutlet.hidden = true
    }
    
    @IBAction func yesButtonTapped(sender: UIButton) {
        rejectCards(playerTurn)
    }
    
    @IBAction func noButtonTapped(sender: UIButton) {
        playerTurn += 1
        if playerTurn == numPlayers{
            playerTurn = 0
            // segue to next VC and determine winner of round
        }
        else{
            setUpVC(playerTurn)
        }
    }
    
    @IBAction func rejectButtonTapped(sender: UIButton) {
        
    }
}





