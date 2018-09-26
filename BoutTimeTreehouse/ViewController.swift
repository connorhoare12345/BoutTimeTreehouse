//
//  ViewController.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 13/04/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController, GameOverDelegate {
    

    
    
    // MARK: Outlets

    // Labels
 
    @IBOutlet weak var eventLabelOne: UILabel!
    @IBOutlet weak var eventLabelTwo: UILabel!
    @IBOutlet weak var eventLabelThree: UILabel!
    @IBOutlet weak var eventLabelfour: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var firstDownButton: UIButton!
    @IBOutlet weak var firstUpButton: UIButton!
    @IBOutlet weak var secondDownButton: UIButton!
    @IBOutlet weak var secondUpButton: UIButton!
    @IBOutlet weak var thirdDownButton: UIButton!
    @IBOutlet weak var thridUpButton: UIButton!
    
    @IBOutlet weak var nextRoundButton: UIButton!
    
    // IBActions
    
    @IBAction func firstDownButtonPressed(_ sender: Any) {
        // swap events from first event and second event
        let firstEvent = events[0]
        let secondEvent = events[1]
        
        events[0] = secondEvent
        events[1] = firstEvent
        
        updateLabel()
    }
    
    @IBAction func firstUpButtonPressed(_ sender: Any) {
        // swap event from first event and second event
        firstDownButtonPressed(self)
    }
    
    @IBAction func secondDownButtonPressed(_ sender: Any) {
        // Swap second event and third event
        let secondEvent = events[1]
        let thirdEvent = events[2]
        
        events[1] = thirdEvent
        events[2] = secondEvent
        
        updateLabel()
    }
    
    @IBAction func secondUpButtonPressed(_ sender: Any) {
        // Swap second event and third event
        secondDownButtonPressed(self)
    }
    
    @IBAction func thirdDownButtonPressed(_ sender: Any) {
        // TODO: Swap third and fourth event
        let thirdEvent = events[2]
        let fourthEvent = events[3]
        
        events[2] = fourthEvent
        events[3] = thirdEvent
        
        updateLabel()
    }
    
    @IBAction func thirdUpButtonPressed(_ sender: Any) {
        // TODO: Swap third and fourth event
        thirdDownButtonPressed(self)
    }
    
    @IBAction func startNextRound(_ sender: UIButton) {
        nextRound()
    }
    
    // SetUp Game
    
    var game: GameModel
    var events: [Content] = []
    var timer: Timer?
    
    required init?(coder aDecoder: NSCoder) {
        do {
            let dictionaryArray = try PlistImporter.dictionary(fromFile: "eventDetails", ofType: "plist")
            let converter = try EventUnarchiver.collection(from: dictionaryArray)
            
            self.game = GameModel(collectionOfEvents: converter)
        } catch let error {
            fatalError("\(error)")
        }
        
        super.init(coder: aDecoder)
    }
    
    // place events in the labels.
    
    func updateLabel() {
        eventLabelOne.text = events[0].movie
        eventLabelTwo.text = events[1].movie
        eventLabelThree.text = events[2].movie
        eventLabelfour.text = events[3].movie
    }
    
    func nextRound() {
        
        guard game.roundsPlayed != game.numberOfRounds else {
            timer?.invalidate()
            
            performSegue(withIdentifier: "goToGameOverSegue", sender: game.correctAnswers)
            
            return
        }
        
        events = game.randomEvents(4)
        timerLabel.text = "1.00"
        
        updateLabel()
        
        nextRoundButton.isHidden = true
        
        game.timer = 60
        timerLabel.isHidden = false
        
        messageLabel.text = "Shake to Complete!"
        
   timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(ViewController.ticker)), userInfo: nil, repeats: true)
    }
    
    
    
    func endRound(answers: Bool) {
        // changing the nextRoundButton image dependant on the answer
        switch answers {
        case true:
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            
        case false:
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
            break
        }
        
        nextRoundButton.isHidden = false
        
        // hidding the timer
        timerLabel.isHidden = true
        
        // stopping the timer
        timer?.invalidate()
        
    }
    
    func playAgainPressed(_ playAgain: Bool) {
        game.correctAnswers = 0
        game.roundsPlayed = 0
        
        nextRound()
    }
    
    // Check for Shake Motion
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            endRound(answers: game.checkOrdering(for: events))
        }
    }
    
    @objc func ticker() {
        game.timer -= 1
        
        if game.timer >= 10 {
            timerLabel.text = "0:\(game.timer)"
        } else if game.timer < 10 {
            timerLabel.text = "0:0\(game.timer)"
        }
        
        if game.timer <= 0 {
            endRound(answers: game.checkOrdering(for: events))
        }
    }
    
    // Prepare for Game Over Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGameOverSegue" {
            if let destination = segue.destination as? GameOverViewController {
                if let score = sender as? Int {
                    destination.score = score
                    destination.delegate = self
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nextRoundButton.isHidden = true
        
        nextRound()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

