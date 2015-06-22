//
//  HomeViewController.swift
//  football
//
//  Created by Pranav Gore on 20/06/15.
//  Copyright (c) 2015 Pranav Gore. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let GameList = ["Guess the football club"]
    var userScores = [0, 0]
    @IBOutlet var GameListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameList.count
    }
    
    override func viewDidAppear(animated: Bool) {
        self.GameListView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.GameListView.dequeueReusableCellWithIdentifier("GameListCell") as! UITableViewCell
        cell.textLabel!.text = GameList[indexPath.row]
        cell.detailTextLabel?.text = "Your current score is \(userScoreOfThisGame)"
        if(userScoreOfThisGame > 3){
            cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-BoldOblique", size: 20.0)
            cell.detailTextLabel?.textColor = UIColor.greenColor()
            cell.backgroundColor = UIColor.orangeColor()
        }else if(userScoreOfThisGame >= 1){
            cell.backgroundColor = UIColor.yellowColor()
        }else{
            cell.backgroundColor = UIColor.grayColor()
        }
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
