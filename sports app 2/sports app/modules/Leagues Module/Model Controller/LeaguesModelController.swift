//
//  LeaguesModelController.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation

class LeaguesModelController : ILeaguesModel {
  
    
  
    let apiservice : ApiServiceLeagues = NetworkMangerInLeague()
    let leaguePresenter : ILeaguesPresenter
    
    init(leaguePresenter : ILeaguesPresenter){
        self.leaguePresenter = leaguePresenter
    }
    
    func fetchDataFromApi(endpoint: String , str : String) {
        apiservice.fetchLeaguess(endPoint: endpoint , str : str) { leagues, error in
            if let leagues = leagues {
                self.leaguePresenter.onSuccess(leagues: leagues)
            }
        }
    }
    
    
}
