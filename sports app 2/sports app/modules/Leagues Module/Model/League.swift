//
//  League.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation



// MARK: - Welcome
struct Leagues: Codable {
    let countries: [League]?
}

// MARK: - League
struct League: Codable {
    var idLeague : String?
    var strLeague : String?
    var strSport : String?
    var strYoutube : String?
    var strPoster : String?
    var strBadge : String?
    // search one name
    var strLeagueAlternate : String?
}
