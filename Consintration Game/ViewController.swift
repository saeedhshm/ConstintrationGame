//
//  ViewController.swift
//  Consintration Game
//
//  Created by Mac on 3/24/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var game = Consintration(numberOfPairsOfCards:(cardButtons.count + 1) / 2 )

    @IBOutlet weak var flipsLabel: UILabel!
    
    var numberOfFlips = 0{
        didSet{
            flipsLabel.text = "Flips: \(numberOfFlips)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👻","☠️","🤡","😻","🤥","😈","👹","🤖","🤠","👾","🎃","👽","🤑","👩","💂‍♂️","🧞‍♀️","🧚‍♀️","🧛‍♂️","🐶","🦍","🦉","🦅","🦇","🐔","🐣","🐥","🦆","🐒","🐺","🦄","🐴","🐝","🦋","🐌","🐞","🦖","🦕","🦑","🦀","🐠","🦎","🦂","🐢","🐡","🐬","🐳","🐋","🐊","🐅","🐆","🦓","🐘","🐪","🦒","🐂","🐄","🐎","🐏","🕊","🐕","🐈","🐓","🐿","🌞","💐","🌺","🌻","🌴","🌲","🌜","🌍","⛄️","☂️","🍪","🏀"]

    @IBAction func touchCard(_ sender: UIButton) {
        numberOfFlips += 1
        
        if let cardNumber = cardButtons.index(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    func updateViewFromModel(){
    
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if !card.isFaceUp {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }else{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            
        }
    }
    
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String{
        
        if emoji[card.identifier] == nil , emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

