//
//  Event.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 21/09/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import Foundation
import UIKit
import GameKit

// MARK: Protocols

protocol Content {
    var movie: String { get }
    var year: Int { get }
    var url: String { get }
}

protocol GameSettings {
    var collectionOfEvent: [Content] { get set }
    var numberOfRounds: Int { get }
    var roundsPlayed: Int { get set }
    var correctAnswers: Int { get set }
    var timer: Int { get }
    
    init(collectionOfEvents: [Content])
    
    func randomEvents(_ number: Int) -> [Content]
    func checkOrdering(for event: [Content]) -> Bool
}

protocol GameOverDelegate {
    func playAgainPressed(_ playAgain: Bool)
}

// MARK: Structs

struct Event: Content {
    let movie: String
    let year: Int
    let url: String
}

// MARK: Enums

enum EventError: Error {
    case invalidResource
    case covnersionError
    case invalidKey
}

enum RandomEventError: Error {
    case randomEventError
    case randomPeriodError
}

// Convert the eventDetails.PList

class PlistImporter {
    static func dictionary(fromFile name: String, ofType type: String) throws -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw EventError.invalidResource
        }
        
        guard let dictionaryArray = NSArray.init(contentsOfFile: path) as? [[String: AnyObject]] else {
            throw EventError.covnersionError
        }
        
        return dictionaryArray
    }
}

// Get event from PList dictionary

class EventUnarchiver {
    static func collection(from array: [[String: AnyObject]]) throws -> [Content] {
        var collection : [Content] = []
        
        for dictionary in array {
            if let event = dictionary["movie"] as? String, let year = dictionary["year"] as? Int, let url = dictionary["url"] as? String {
                let event = Event(movie: event, year: year, url: url)
                collection.append(event)
            } else {
                print("Event was not added!")
                throw EventError.invalidKey
            }
        }
        return collection
    }
}


class GameModel: GameSettings {
    
    var collectionOfEvent: [Content]
    let numberOfRounds: Int = 6
    var roundsPlayed: Int = 0
    var correctAnswers: Int = 0
    var timer: Int = 60
    
    required init(collectionOfEvents: [Content]) {
        self.collectionOfEvent = collectionOfEvents
    }
    
    // retreiving a random event
    func randomEvents(_ number: Int) -> [Content] {
        var chosenEvents : [Content] = []
        var usedIndex: [Int] = []
        
        while chosenEvents.count < number {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: collectionOfEvent.count)
            if usedIndex.contains(randomNumber) == false {
                chosenEvents.append(collectionOfEvent[randomNumber])
                usedIndex.append(randomNumber)
            }
        }
        return chosenEvents
    }
    
    // check ordering for the current event 
    func checkOrdering(for event: [Content]) -> Bool {
        if event[0].year > event[1].year && event[1].year > event[2].year && event[2].year > event[3].year {
            correctAnswers += 1
            roundsPlayed += 1
            return true
        } else {
            roundsPlayed += 1
            return false
        }
    }
}



