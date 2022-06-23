//
//  Event.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


class Events : Codable {
    let events : [Event]?
}

class Event : Codable {
    
    var idEvent : String?
    var strEvent : String?
    var strEventAlternate : String?
    var strFilename : String?
    var strSport : String?
    var idLeague : String?
    var strHomeTeam : String?
    var intHomeScore : String?
    var strAwayTeam : String?
    var intAwayScore : String?
    var dateEvent : String?
    var dateEventLocal : String?
    var strTime : String?
    var strTimeLocal : String?
    var strThumb : String?
    
    
}
