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
    
    func fetchDataFromApi(endpoint: String ) {
        
        apiservice.fetchLeaguess(endPoint: endpoint, Completion: { leagues, error in
            if let leagues = leagues {
                self.leaguePresenter.onSuccess(leagues: leagues)
            }else {
                self.leaguePresenter.onFailed(error: error as! Error)
            }
        })
    
    }
    
    
}
