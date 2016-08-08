//
//  Player.swift
//  Poker
//
//  Created by Saurav Desai on 8/8/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import Foundation

class Player{
    var name : String = ""
    var hand = [Card]()
    var handRank : Int = Int.min
    var myMoney : Int = 0
    var amountToBet : Int = 0
    var highestCard : Int = 0
    
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
    
    func onePair() -> Bool{
        for i in 0..<hand.count-1{
            let current = hand[i].value
            let next = hand[i+1].value
            if current == next{
                return true
            }
        }
        return false
    }
    
    func twoPair() -> Bool{
        var key = -1
        for i in 0..<hand.count-1{
            let current = hand[i].value
            let next = hand[i+1].value
            if current == next{
                key = current
                break
            }
        }
        if key == -1{
            return false
        }
        for i in 0..<hand.count-1{
            let current = hand[i].value
            let next = hand[i+1].value
            if current == next && current != key{
                return true
            }
        }
        return false
    }
    
    func threeOfAKind() -> Bool{
        for i in 0..<hand.count-2{
            let current = hand[i].value
            let next = hand[i+1].value
            let third = hand[i+2].value
            if current == next && next == third{
                return true
            }
        }
        return false
    }
    
    func straight() -> Bool{
        for i in 0..<hand.count-1{
            let current = hand[i].value
            let next = hand[i+1].value
            if (current + 1) != next{
                return false
            }
        }
        return true
    }
    
    func flush() -> Bool{
        for i in 0..<hand.count-1{
            let current = hand[i].suit
            let next = hand[i+1].suit
            if current != next{
                return false
            }
        }
        return true
    }
    
    func fullHouse() -> Bool{
        var key = -1
        for i in 0..<hand.count-2{
            let current = hand[i].value
            let next = hand[i+1].value
            let third = hand[i+2].value
            if current == next && next == third{
                key = current
                break
            }
        }
        if key == -1{
            return false
        }
        for i in 0..<hand.count-1{
            let current = hand[i].value
            let next = hand[i+1].value
            if current == next && current != key{
                return true
            }
        }
        return false
    }
    
    func fourOfAKind() -> Bool{
        for i in 0..<hand.count-3{
            let current = hand[i].value
            let next = hand[i+1].value
            let third = hand[i+2].value
            let fourth = hand[i+3].value
            if current == next && next == third && third == fourth{
                return true
            }
        }
        return false
    }
    
    func straightFlush() -> Bool{
        let a = self.straight()
        let b = self.flush()
        return a&&b
    }
    
    func royalFlush() -> Bool{
        let a = self.flush()
        var b = false
        let card0 = hand[0].value
        let card1 = hand[1].value
        let card2 = hand[2].value
        let card3 = hand[3].value
        let card4 = hand[4].value
        if card0 == 1 && card1 == 10 && card2 == 11 && card3 == 12 && card4 == 13{
            b = true
        }
        return a&&b
    }
    
    func getHandRank(){
        if self.royalFlush(){
            self.handRank = 9
        }
        else if self.straightFlush(){
            self.handRank = 8
        }
        else if self.fourOfAKind(){
            self.handRank = 7
        }
        else if self.fullHouse(){
            self.handRank = 6
        }
        else if self.flush(){
            self.handRank = 5
        }
        else if self.straight(){
            self.handRank = 4
        }
        else if self.threeOfAKind(){
            self.handRank = 3
        }
        else if self.twoPair(){
            self.handRank = 2
        }
        else if self.onePair(){
            self.handRank = 1
        }
        else{
            self.handRank = 0
        }
    }
    
    func getHighestCard(){
        var max = -1
        if self.handRank == 0{
            for i in 0..<hand.count{
                if hand[i].value > max{
                    max = hand[i].value
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 1{
            for i in 0..<hand.count-1{
                if hand[i].value == hand[i+1].value{
                    max = hand[i].value
                    break
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 2{
            var current = -1
            var next = -1
            var firstPos = -1
            for i in 0..<hand.count-1{
                current = hand[i].value
                next = hand[i+1].value
                if current == next{
                    max = current
                    firstPos = i+2
                    break
                }
            }
            for i in 0..<hand.count-1{
                current = hand[i].value
                next = hand[i+1].value
                if current == next && current >= max{
                    max = current
                    break
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 3{
            for i in 0..<hand.count-2{
                let current = hand[i].value
                let next = hand[i+1].value
                let third = hand[i+2].value
                if current == next && next == third{
                    max = current
                    break
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 4{
            max = hand[4].value
            self.highestCard = max
        }
        else if self.handRank == 5{
            for i in 0..<hand.count{
                if hand[i].value >= max{
                    max = hand[i].value
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 6{
            for i in 0..<hand.count{
                if hand[i].value >= max{
                    max = hand[i].value
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 7{
            for i in 0..<hand.count-3{
                let current = hand[i].value
                let next = hand[i+1].value
                let third = hand[i+2].value
                let fourth = hand[i+3].value
                if current == next && next == third && third == fourth{
                    max = current
                    break
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 8{
            for i in 0..<hand.count{
                if hand[i].value >= max{
                    max = hand[i].value
                }
            }
            self.highestCard = max
        }
        else if self.handRank == 9{
            self.highestCard = -1 // royal flush ties
        }
        else{
            self.highestCard = Int.min
        }
    }
}














