//
//  ModelControllerInDetails.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


class DetailsModelController : ITeamModel {
    
    let apiServiceINTeam : ApiServicesOfTeams = NetworkMangerInDetail()
    let teamPresenter : ITeamPresenter
    
    init(teampresenter : ITeamPresenter){
        self.teamPresenter = teampresenter
    }
    
    func fetchDataOfTeamsFromApi(endPoint: String) {
        apiServiceINTeam.fetchDataOfTeams(endPoint: endPoint) { teams, error in
            if let teams = teams {
                self.teamPresenter.onSuccessTeams(teams: teams)
            }else{
                self.teamPresenter.onFailedTeams(error: error as! Error)
            }
        }
    }
    
    
}
