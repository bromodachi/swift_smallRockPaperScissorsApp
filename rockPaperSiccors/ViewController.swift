//
//  ViewController.swift
//  rockPaperSiccors
//
//  Created by XcodeUser on 9/2/15.
//  Copyright (c) 2015 XcodeUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    var match: RPSMatch?
    var history = [RPSMatch]()
    var matchNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func results(choice : AnyObject?){
        let choiceButton = choice as! UIButton
        switch(choiceButton){
        case self.rock:
            self.startGame(RPSChoice.rock)
        case self.scissors:
            self.startGame(RPSChoice.scissors)
        case self.paper:
            self.startGame(RPSChoice.paper)
        default:
            println("shouldnt happen")
        }

        
      //  self.performSegueWithIdentifier("getResult", sender: self)
    }
    
    @IBAction func showHistory(sender: AnyObject) {
        let storyboard = self.storyboard
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController")as! HistoryViewController
        
        controller.historyMatches = self.history
        
        self.presentViewController(controller, animated: true, completion: nil)

        
    }
    
    func startGame (player: RPSChoice){
        let phoneChoice = RPSChoice()
        matchNum++
        
        let match = RPSMatch(p1 : player, p2 : phoneChoice, matchNum: matchNum)
        self.match = match
        history.insert(match, atIndex: 0)
        self.performSegueWithIdentifier("GetResult", sender: self)
        
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GetResult"{
            let controller = segue.destinationViewController as! GetResult
            controller.match = self.match
            
      //      controller.playerChoice = playerChoice
            
            
        }
        else if segue.identifier == "historySeg"{
            let controller = segue.destinationViewController as! HistoryViewController
            controller.historyMatches = self.history
            println("right here")
            
        }
    }
    
    func randomValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    


}

