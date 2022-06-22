//
//  Sports.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


// MARK: - Sport


struct Sports: Codable {
    let sports: [Sport]
}


struct Sport: Codable {
    let idSport : String
    let strSport: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}


enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}

