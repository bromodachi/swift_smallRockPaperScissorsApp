//
//  GetResult.swift
//  rockPaperSiccors
//
//  Created by XcodeUser on 9/7/15.
//  Copyright (c) 2015 XcodeUser. All rights reserved.
//

import UIKit

class GetResult: UIViewController {

    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var winScreen: UIImageView!
    var match : RPSMatch!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.winScreen.image = getImage(match)
        
        self.winLabel.text  = getMessage(match)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.winScreen.alpha = 1
        }
    }
    
    func getImage(match : RPSMatch)->UIImage{
        var name = ""
        switch(match.winner){
            case .rock:
                name = "rockWins"
            case .scissors:
                name =  "scissorsWins"
            case .paper:
                name = "paperWins"
        }
        
        if(match.p1 == match.p2){
            name = "tie"
        }
        return UIImage(named: name)!
        
        
    }
    
    func getMessage(match : RPSMatch) -> String{
        if(match.p1 == match.p2){
            return "It's a tie!! Do you like the tie??"
        }
        else if (match.winner == match.p1){
            return "Yay! You won!!!"
        }
        else{
            return "You lost! :("
        }
    }
    
    /**
    *    dismiss this view controller
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}