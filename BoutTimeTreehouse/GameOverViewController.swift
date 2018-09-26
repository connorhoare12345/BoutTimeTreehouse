//
//  GameOverViewController.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 25/09/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
 
    @IBOutlet weak var scoreMessageLabel: UILabel!
    
    
    var delegate: GameOverDelegate! = nil
    var score: Int = 0
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        delegate.playAgainPressed(true)
        
        score = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreMessageLabel.text = "\(score)/6"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
