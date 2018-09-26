//
//  FactModel.swift
//  BoutTimeTreehouse
//
//  Created by Connor hoare on 15/04/2018.
//  Copyright © 2018 Connor hoare. All rights reserved.
//

import Foundation
import GameKit

struct HistoricalEventModel {
    let film : String
    let date : Int
    let url : String
}

let event1 = HistoricalEventModel(film: "The Social Network", date: 2010, url: "https://en.wikipedia.org/wiki/The_Social_Network")
let event2 = HistoricalEventModel(film: "Capote", date: 2005, url: "https://en.wikipedia.org/wiki/Capote_(film)")
let event3 = HistoricalEventModel(film: "Gravity", date: 2013, url: "https://en.wikipedia.org/wiki/Gravity_(2013_film")
let event4 = HistoricalEventModel(film: "Whiplash", date: 2014, url: "https://en.wikipedia.org/wiki/Whiplash_(2014_film)")
let event5 = HistoricalEventModel(film: "Django Unchained", date: 2012, url: "https://en.wikipedia.org/wiki/Django_Unchained")
let event6 = HistoricalEventModel(film: "Good Will Hunting", date: 1997, url: "en.wikipedia.org/wiki/Good_Will_Hunting")
let event7 = HistoricalEventModel(film: "Deadpool", date: 2016, url: "https://en.wikipedia.org/wiki/Deadpool_(film)")
let event8 = HistoricalEventModel(film: "The Road", date: 2009, url: "https://en.wikipedia.org/wiki/The_Road_(2009_film")
let event9 = HistoricalEventModel(film: "The Big Short", date: 2015, url: "https://en.wikipedia.org/wiki/The_Big_Short_(film)")
let event10 = HistoricalEventModel(film: "The Godfathe", date: 1972, url: "https://en.wikipedia.org/wiki/The_Godfather")

let arrayOfEvents = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10]

