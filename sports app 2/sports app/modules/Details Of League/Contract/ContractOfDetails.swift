//
//  ContractOfDetails.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


// teams
protocol ITeamView {
    func renderTeams(teams : [Team] )
    func postErrorInTeams(error : Error)
    
}


protocol ITeamPresenter {
    
    func fetchDataOfTeams(endPoint : String)
    func onSuccessTeams(teams : [Team])
    func onFailedTeams(error : Error)
    
}

protocol ITeamModel {
    
    func fetchDataOfTeamsFromApi(endPoint : String)
    
}

