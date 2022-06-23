//
//  PresenteriNDetails.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


class DetailsPresenter : ITeamPresenter {
    
    let teamsView : ITeamView
    init(teamsview : ITeamView){
        self.teamsView = teamsview
    }
    
    func fetchDataOfTeams(endPoint: String) {
        let homeTeamsMOdel = DetailsModelController(teampresenter: self)
        homeTeamsMOdel.fetchDataOfTeamsFromApi(endPoint: endPoint)
    }
    
    func onSuccessTeams(teams: [Team]) {
        teamsView.renderTeams(teams: teams)
    }
    
    func onFailedTeams(error: Error) {
        teamsView.postErrorInTeams(error: error)
    }
    
    
    
}
