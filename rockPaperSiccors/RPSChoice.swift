//
//  getResult.swift
//  rockPaperSiccors
//
//  Created by XcodeUser on 9/2/15.
//  Improved version with match history 9/7/2015
//  Copyright (c) 2015 XcodeUser. All rights reserved.
//

import Foundation

enum RPSChoice {
    case rock, paper, scissors
    
    init () {
        switch arc4random() % 3{
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissors
        }
    }
    
    func getResult (player: RPSChoice) -> Bool {
        switch (self, player){
            //*(winner, loser)
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
            return true
        default:
            return false
        }
    }
    
    var description: String {
        get {
            switch (self) {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
        }
    }

}
/*class getResult: UIViewController {
    var phoneChoice: Int?
    var playerChoice: Int?
    
    @IBOutlet weak var winScreen: UIImageView!
    
    @IBOutlet weak var winLabel: UILabel!
    override func viewWillAppear(animated: Bool) {
        

        let phoneValue = self.phoneChoice
        
        let playerValue = self.playerChoice
        
        if phoneValue == playerValue{
            winScreen.image = UIImage(named: "w4")
            winLabel.text = "It's a tie, like the tie?"
            
        }
        else if phoneValue == 1 && playerValue == 2{
            //paper wins phone wins
            winScreen.image = UIImage(named: "w1")
            winLabel.text = "Sorry, you lose :("
            
        }
        else if phoneValue == 1 && playerValue == 3{
            //paper loses, player wins
            winScreen.image = UIImage(named: "w3")
            winLabel.text = "Yay, you won!!!"
        }
        else if phoneValue == 2 && playerValue == 1{
            //rock loses player wins
            winScreen.image = UIImage(named: "w1")
            winLabel.text = "Yay, you won!!!"
        }
        else if phoneValue == 2 && playerValue == 3{
            //rock wins, player loses
            winScreen.image = UIImage(named: "w2")
            winLabel.text = "Sorry, you lose :("
            
        }
        else if phoneValue == 3 && playerValue == 1{
            //scissors wins phone wins
            winScreen.image = UIImage(named: "w3")
            winLabel.text = "Sorry, you lose :("
            
        }
        else if phoneValue == 3 && playerValue == 2{
            //scissors loses, player wins
            winScreen.image = UIImage(named: "w2")
            winLabel.text = "Yay, you won!!!"
            
        }
        
        winScreen.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.winScreen.alpha = 1
        }
    }
    
    /**)
    * accepts a conditional Int, and returns an dice image, or nil
    */
    
    func imageForValue(value: Int?) -> UIImage? {
        return nil
    }
    
    /**
    *    dismiss this view controller
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}*/