//
//  FactModel.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 15/04/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import Foundation
import GameKit

struct Event {
    let film : String
    let date : Int
    let url : String
}

struct EventManager {
    var currentIndex = 0
    var shownEvent = [Int]()
    
    
    let arrayOfFilms = [
    Event(film: "Inside Out", date: 2015, url: "https://en.wikipedia.org/wiki/Inside_Out_(2015_film)"),
    Event(film: "Django Unchained", date: 2012, url: "https://en.wikipedia.org/wiki/Django_Unchained"),
    Event(film: "La La Land", date: 2016, url: "https://en.wikipedia.org/wiki/La_La_Land_(film)"),
    Event(film: "Inception", date: 2010, url: "https://en.wikipedia.org/wiki/Inception"),
    Event(film: "The Wolf of Wall Street", date: 2013, url: "https://en.wikipedia.org/wiki/The_Wolf_of_Wall_Street_(2013_film)"),
    Event(film: "Dawn of the Planet of the Apes", date: 2014, url: "https://en.wikipedia.org/wiki/Dawn_of_the_Planet_of_the_Apes"),
    Event(film: "War Horse", date: 2011, url: "https://en.wikipedia.org/wiki/War_Horse_(film)"),
    Event(film: "Darkest Hour", date: 2017, url: "https://en.wikipedia.org/wiki/Darkest_Hour_(film)"),
    Event(film: "Black Panther", date: 2018, url: "https://en.wikipedia.org/wiki/Black_Panther_(film)")
    ]
    
    mutating func eventProvider()  {
      
        if shownEvent.count > arrayOfFilms.count {
            currentIndex = GKRandomSource.sharedRandom().nextInt(upperBound: arrayOfFilms.count)
            shownEvent.append(currentIndex)
        }
        
        
    }
    
}
