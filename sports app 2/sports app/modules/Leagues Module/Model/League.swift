//
//  League.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation



// MARK: - Welcome
struct Leagues: Codable {
    let leagues: [League]
}

// MARK: - League
struct League: Codable {
    let idLeague : String
    let strLeague : String
    let strSport : String
    let strLeagueAlternate: String?
}
