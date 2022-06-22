//
//  LeaguesPresenter.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


class leaguesPresenter : ILeaguesPresenter {
 
    

    
    
    let leagueView : ILeaguesView
    
    init (leagueView : ILeaguesView ){
        self.leagueView = leagueView
    }
    
    func fetchData(endpoint: String ) {
        let homeModel = LeaguesModelController(leaguePresenter: self)
        homeModel.fetchDataFromApi(endpoint: endpoint)
        
    }
    
    func onSuccess(leagues: [League]) {
        leagueView.renderAllLeagues(leagues: leagues)
    }
    
    func onFailed(error: Error) {
        leagueView.postErroeInLeagues(error: error)
    }
    
    
    
}
