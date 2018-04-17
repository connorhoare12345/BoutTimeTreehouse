//
//  ViewController.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 13/04/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    var eventManager = EventManager()
    
    
    @IBOutlet weak var eventLabel1: UILabel!
    @IBOutlet weak var eventLabel2: UILabel!
    @IBOutlet weak var eventLabel3: UILabel!
    @IBOutlet weak var eventLabel4: UILabel!
    
    var currentIndex = 0
    var shownEvent : [Int] = []
    
    func eventProvider() {
       
        
        
        }
        
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventProvider()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

