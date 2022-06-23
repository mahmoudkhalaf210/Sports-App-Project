//
//  Team.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


class Teams: Codable{
    let teams : [Team]?
}

class Team : Codable {
    var idTeam : String?
    var strTeam : String?
    var strSport : String?
    var strLeague : String?
    var strFacebook : String?
    var strDescriptionEN : String?
    var strDescriptionDE : String?
    var strDescriptionFR : String?
    var strCountry : String?
    var strTeamBadge : String?
    var strTeamJersey : String?
    var strTeamLogo : String?
    var strTeamFanart1 : String?
    var strTeamFanart2 : String?
    var strTeamFanart3 : String?
    var strTeamFanart4 : String?
    var strTeamBanner : String?
    var strYoutube : String?
    var strWebsite : String?
    var strAlternate : String?
    var strTeamShort : String?
    
}
