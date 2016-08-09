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
    var tapRecognizer0 = UITapGestureRecognizer()
    var tapRecognizer1 = UITapGestureRecognizer()
    var tapRecognizer2 = UITapGestureRecognizer()
    var tapRecognizer3 = UITapGestureRecognizer()
    var tapRecognizer4 = UITapGestureRecognizer()
    var roundWinners : [String] = []
    var rankThatWon : String = ""
    var isSecond = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deck.shuffleDeck()
        dealCards()
        tapRecognizer0 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card0Tapped))
        tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card1Tapped))
        tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card2Tapped))
        tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card3Tapped))
        tapRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.card4Tapped))
        cardImageViews[0].addGestureRecognizer(tapRecognizer0)
        cardImageViews[1].addGestureRecognizer(tapRecognizer1)
        cardImageViews[2].addGestureRecognizer(tapRecognizer2)
        cardImageViews[3].addGestureRecognizer(tapRecognizer3)
        cardImageViews[4].addGestureRecognizer(tapRecognizer4)
        setUpVC(playerTurn)
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
        flipButtonOutlet.hidden = false
        rejectCardsView.hidden = true
        nextButtonOutlet.hidden = true
        roundLabel.text = "Round \(roundCount)"
        playerTurnLabel.text = "\(players[num].name)'s Turn"
        rejectCardsLabel.text = "Reject Cards?"
        displayBacks()
        for imageView in cardImageViews{
            imageView.userInteractionEnabled = false
        }
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
    
    func endOfRoundAlertMessage(message : String){
        let alert = UIAlertController(title: "Round Complete", message: message, preferredStyle: .Alert)
        let nextButton = UIAlertAction(title: "Next", style: .Default) { _ in
            self.performSegueWithIdentifier("EndOfRound", sender: self)
        }
        alert.addAction(nextButton)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func determineRoundWinner(){
        var winner : Int = -1
        var handRanks = [Int]()
        var winnerList = [Int]()
        var highestCards = [Int]()
        for i in 0..<players.count{
            players[i].sortHand()
            players[i].determineHandRank()
            handRanks.append(players[i].handRank)
        }
        var maxRank = -1
        for i in 0..<handRanks.count{
            if handRanks[i] >= maxRank{
                maxRank = handRanks[i]
            }
        }
        var maxRankCount = 0
        for i in 0..<handRanks.count{
            if handRanks[i] == maxRank{
                maxRankCount += 1
                winnerList.append(i)
            }
        }
        switch maxRank{
        case 9:
            rankThatWon = "Royal Flush"
        case 8:
            rankThatWon = "Straight Flush"
        case 7:
            rankThatWon = "Four Of A Kind"
        case 6:
            rankThatWon = "Full House"
        case 5:
            rankThatWon = "Flush"
        case 4:
            rankThatWon = "Straight"
        case 3:
            rankThatWon = "Three of a Kind"
        case 2:
            rankThatWon = "Two Pair"
        case 1:
            rankThatWon = "One Pair"
        default:
            rankThatWon = "No Pair"
        }
        if maxRankCount > 1 && maxRank != 9{ // non royal flush ties
            for i in 0..<winnerList.count{
                players[winnerList[i]].getHighestCard()
                highestCards.append(players[winnerList[i]].highestCard)
            }
            var maxCard = -1
            for i in 0..<winnerList.count{
                if highestCards[i] > maxCard{
                    maxCard = highestCards[i]
                    winner = winnerList[i]
                }
            }
            players[winner].money += pot
            roundWinners.append(players[winner].name)
            let alertMessage = "\(roundWinners[0]) is the winner of this round (\(rankThatWon), $\(pot))."
            pot = 0
            self.endOfRoundAlertMessage(alertMessage)
        }
        if maxRankCount > 1 && maxRankCount == 9{ // extremely rare royal flush ties
            if pot % maxRankCount != 0{
                var amountToReduce = pot % maxRankCount
                pot -= amountToReduce
                amountToReduce = 0
            }
            var moneyToAward = pot/maxRankCount
            for i in 0..<winnerList.count{
                players[winnerList[i]].money += moneyToAward
            }
            for i in 0..<winnerList.count{
                roundWinners.append(players[winnerList[i]].name)
            }
            var alertMessage = "Round Winners: "
            for i in 0..<winnerList.count{
                if i == winnerList.count-1{
                    alertMessage += "\(players[winnerList[i]].name) "
                    break
                }
                alertMessage += "\(players[winnerList[i]].name), "
            }
            alertMessage += "(Royal Flush, \(moneyToAward))."
            pot = 0
            moneyToAward = 0
            self.endOfRoundAlertMessage(alertMessage)
        }
        if maxRankCount == 1{ // no ties
            winner = winnerList[0]
            players[winner].money += pot
            roundWinners.append(players[winner].name)
            let alertMessage = "\(roundWinners[0]) is the winner of this round (\(rankThatWon), $\(pot))."
            pot = 0
            self.endOfRoundAlertMessage(alertMessage)
        }
    }
    
    @IBAction func flipAndShowCards(sender: UIButton) {
        displayCards(playerTurn)
        flipButtonOutlet.hidden = true
        rejectCardsView.hidden = false
        rejectButtonOutlet.hidden = true
        rejectCardsLabel.hidden = false
        yesButtonOutlet.hidden = false
        noButtonOutlet.hidden = false
        if isSecond == true{
            nextButtonOutlet.hidden = false
            rejectCardsLabel.hidden = true
            noButtonOutlet.hidden = true
            yesButtonOutlet.hidden = true
            isSecond = false
        }
    }
    
    @IBAction func yesButtonTapped(sender: UIButton) {
        rejectCardsLabel.text = "Reject Up to 3"
        yesButtonOutlet.hidden = true
        noButtonOutlet.hidden = true
        rejectButtonOutlet.hidden = false
        for image in cardImageViews{
            image.userInteractionEnabled = true
        }
    }
    
    @IBAction func noButtonTapped(sender: UIButton) {
        if (playerTurn + 1) == numPlayers{
            playerTurn = 0
            self.determineRoundWinner()
        }
        else{
            playerTurn += 1
            numTapped = 0
            setUpVC(playerTurn)
        }
    }
    
    @IBAction func rejectButtonTapped(sender: UIButton) {
        rejectCards(playerTurn)
        for imageView in cardImageViews{
            imageView.userInteractionEnabled = false
        }
        rejectCardsLabel.hidden = true
        rejectButtonOutlet.hidden = true
        nextButtonOutlet.hidden = true
        flipButtonOutlet.hidden = false
        isSecond = true
        numTapped = 0
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if (playerTurn + 1) == numPlayers{
            playerTurn = 0
            self.determineRoundWinner()
        }
        else{
            playerTurn += 1
            setUpVC(playerTurn)
            numTapped = 0
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}





