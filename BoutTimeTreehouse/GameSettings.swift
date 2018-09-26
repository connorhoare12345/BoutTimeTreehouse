//
//  GameSettings.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 20/09/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import Foundation

class GameSettings {
    
    let numberOfRounds: Int
    let numberOfOptions = 4
    var roundsPlayed = 0
    
    init(numberOfRounds: Int) {
        self.numberOfRounds = numberOfRounds
    }
    
}

enum PositionSelection {
    case mostRecent
    case secondPosition
    case thirdPosition
    case Oldest
    
}
