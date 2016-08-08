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
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet var cardUIViews: [UIView]!
    
    var numTapped : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rejectCardsView.hidden = true
        nextButtonOutlet.hidden = true
        deck.shuffleDeck()
        dealCards()
        setUpVC(playerTurn)
        for imageView in cardImageViews{
            imageView.userInteractionEnabled = true
        }
    }
    
    func card0Tapped(){
        if cardUIViews[0].backgroundColor == UIColor.greenColor(){
            cardUIViews[0].backgroundColor = UIColor.clearColor()
            numTapped -= 1
        }
        else{
            if numTapped < 3{
                cardUIViews[0].backgroundColor = UIColor.greenColor()
                numTapped += 1
            }
        }
    }
    
    func card1Tapped(){
        if cardUIViews[1].backgroundColor == UIColor.greenColor(){
            cardUIViews[1].backgroundColor = UIColor.clearColor()
            numTapped -= 1
        }
        else{
            if numTapped < 3{
                cardUIViews[1].backgroundColor = UIColor.greenColor()
                numTapped += 1
            }
        }
    }
    
    func card2Tapped(){
        if cardUIViews[2].backgroundColor == UIColor.greenColor(){
            cardUIViews[2].backgroundColor = UIColor.clearColor()
            numTapped -= 1
        }
        else{
            if numTapped < 3{
                cardUIViews[2].backgroundColor = UIColor.greenColor()
                numTapped += 1
            }
        }
    }
    
    func card3Tapped(){
        if cardUIViews[3].backgroundColor == UIColor.greenColor(){
            cardUIViews[3].backgroundColor = UIColor.clearColor()
            numTapped -= 1
        }
        else{
            if numTapped < 3{
                cardUIViews[3].backgroundColor = UIColor.greenColor()
                numTapped += 1
            }
        }
    }
    
    func card4Tapped(){
        if cardUIViews[4].backgroundColor == UIColor.greenColor(){
            cardUIViews[4].backgroundColor = UIColor.clearColor()
            numTapped -= 1
        }
        else{
            if numTapped < 3{
                cardUIViews[4].backgroundColor = UIColor.greenColor()
                numTapped += 1
            }
        }
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
        if numTapped != 0{
            for i in 0..<cardUIViews.count{
                if cardUIViews[i].backgroundColor == UIColor.greenColor(){
                    players[num].hand.removeAtIndex(i)
                    players[num].hand.insert(deck.cards[0], atIndex: i)
                    deck.cards.removeAtIndex(0)
                    cardUIViews[i].backgroundColor = UIColor.clearColor()
                    cardImageViews[i].image = UIImage(named: "BackOfACard")
                }
            }
        }
    }
    
    @IBAction func flipAndShowCards(sender: UIButton) {
        displayCards(playerTurn)
        flipButtonOutlet.hidden = true
        rejectCardsView.hidden = false
        rejectButtonOutlet.hidden = true
    }
    
    @IBAction func yesButtonTapped(sender: UIButton) {
        rejectCardsLabel.text = "Reject Up to 3"
        yesButtonOutlet.hidden = true
        noButtonOutlet.hidden = true
        rejectButtonOutlet.hidden = false
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
    
    @IBAction func noButtonTapped(sender: UIButton) {
        //playerTurn += 1
        if playerTurn == numPlayers{
            playerTurn = 0
            // segue to next VC and determine winner of round
        }
        else{
            //setUpVC(playerTurn)
        }
    }
    
    @IBAction func rejectButtonTapped(sender: UIButton) {
        rejectCards(playerTurn)
        for imageView in cardImageViews{
            imageView.userInteractionEnabled = false
        }
        rejectCardsLabel.hidden = true
        rejectButtonOutlet.hidden = true
        nextButtonOutlet.hidden = false
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if (playerTurn + 1) == numPlayers{
            // playerTurn = 0
            // determine winner of round
        }
        else{
            //CONTINUE HERE
        }
    }
}





