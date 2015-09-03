//
//  ViewController.swift
//  rockPaperSiccors
//
//  Created by XcodeUser on 9/2/15.
//  Copyright (c) 2015 XcodeUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    var playerChoice: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func results(choice : AnyObject?){
        if choice?.currentTitle == "rock"{
            playerChoice = 2
        }
        else if choice?.currentTitle == "scissors"{
           playerChoice = 3
        }
        else if choice?.currentTitle == "paper"{
            playerChoice = 1
        }
        
        self.performSegueWithIdentifier("getResult", sender: self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "getResult"{
            let controller = segue.destinationViewController as! getResult
            controller.phoneChoice = randomValue()
            controller.playerChoice = playerChoice
            
            
        }
    }
    
    func randomValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    


}

