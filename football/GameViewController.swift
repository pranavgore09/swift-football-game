//
//  GameViewController.swift
//  football
//
//  Created by Pranav Gore on 20/06/15.
//  Copyright (c) 2015 Pranav Gore. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var TimetText: UILabel!
    @IBOutlet var OptionsTableView: UITableView!
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var QuestionText: UILabel!
    var currentQuestion: MCQ?
    var game: Game?
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    var timer = NSTimer()
    var maxSecondsForOneQ: Int = 5
    var seconds: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.game = Game(id: 1, name: "Guess the Football Club", questionString: "Which football clus is this ?", data: generateMCQ())
        showNextQuestion()
        score=0
        seconds = maxSecondsForOneQ
        // Do any additional setup after loading the view.
    }

    func showNextQuestion()-> Void{
        if(self.currentQuestionIndex >= self.game?.data.count){
            println("End. Score = \(score)")
            self.dismissViewControllerAnimated(true, completion: nil)
        }else{
            self.currentQuestion = self.game?.data[self.currentQuestionIndex]
            self.updareQuestionUI()
            self.currentQuestionIndex++
        }
    }
    
    func generateRandomColor()-> UIColor{
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    func tick(){
        seconds--
        TimetText.text = "Timer: \(seconds)"
        if(seconds == 0){
            timer.invalidate()
            moveAhead(-1)
        }
    }
    
    func setupTimer()-> Void{
        timer.invalidate()
        seconds = maxSecondsForOneQ
        TimetText.text = "Timer: \(maxSecondsForOneQ)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tick"), userInfo: nil, repeats: true)
    }
    
    func updareQuestionUI()-> Void{
        self.setupTimer()
        self.view.backgroundColor = generateRandomColor()
        QuestionText.text = game?.questionString
        ImageView.image = UIImage(named: currentQuestion!.imagePath)
        OptionsTableView.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.OptionsTableView.dequeueReusableCellWithIdentifier("OptionCell") as! UITableViewCell
        cell.textLabel?.text = currentQuestion?.options[indexPath.row]
        return cell
    }
    
    func updateScore(answerIndex: Int)-> Void{
        if(answerIndex == currentQuestion?.correctOptionIndex){
            score++
        }
    }
    
    func moveAhead(ans: Int)-> Void{
        updateScore(ans)
        showNextQuestion()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        moveAhead(indexPath.row)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion!.options.count
    }
    
    override func viewWillDisappear(animated: Bool) {
        game = nil
        currentQuestion = nil
        timer.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
