//
//  HistoryViewController.swift
//  rockPaperSiccors
//
//  Created by XcodeUser on 9/7/15.
//  Copyright (c) 2015 XcodeUser. All rights reserved.
//

import UIKit
import Foundation


class HistoryViewController :
 UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var historyMatches : [RPSMatch]!
    
    @IBOutlet weak var back: UIBarButtonItem!
    var testTable = ["blah", "things", "I hate", "life"]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.historyMatches.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("i cme here")
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        let history = self.historyMatches[indexPath.row]
        
        // Set the name and image
        
    //    var winOrLose  = history.statusString

        cell.textLabel?.text = history.statusString
        cell.imageView?.image = getImage(history)
        if let detailTextLabel = cell.detailTextLabel {
           detailTextLabel.text = "#\(history.matchNumber): \(history.p1.description) vs \(history.p2.description)"
       }
        
        return cell
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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        println("am i showing the table?")
        return true
    }
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidLoad()
    }
    @IBAction func backButton(sender: AnyObject) {
            self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}