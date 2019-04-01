//
//  Consintration.swift
//  Consintration Game
//
//  Created by Mac on 3/25/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Consintration {
    
    var cards = Array<Card>()
    
    var indexOneAndOnlyFaceUpCard:Int?
    
    func chooseCard(at index:Int){
        
        if !cards[index].isMatched{
            if let matchIndex = indexOneAndOnlyFaceUpCard,matchIndex != index{
                //check if the cards are matched
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOneAndOnlyFaceUpCard = nil
                
            }else{
                //either no cards or 2 cars are face up
                for flibDownIndex in cards.indices{
                    cards[flibDownIndex].isFaceUp = false
                }
                if cards[index].isFaceUp{
                    cards[index].isFaceUp = false
                    indexOneAndOnlyFaceUpCard = nil
                }else{
                    cards[index].isFaceUp = true
                    indexOneAndOnlyFaceUpCard = index
                }
            }
        }
       
    }
    
    init(numberOfPairsOfCards:Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    
    }

}

struct Card{
    var isFaceUp = false
    var isMatched = false
    
    var identifier:Int
    
   private static var identifireFactory = 0
    
    private static func getUniqueIdentifier()->Int{
        identifireFactory += 1
        return identifireFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
