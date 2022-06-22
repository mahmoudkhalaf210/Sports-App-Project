//
//  LeaguesPresenter.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


class leaguesPresenter : ILeaguesPresenter {
 
    

    
    
    let leagueView : ILeaguesView
    var strSport : String
    
    init (leagueView : ILeaguesView , str : String){
        self.leagueView = leagueView
        self.strSport = str
    }
    
    func fetchData(endpoint: String ) {
        let homeModel = LeaguesModelController(leaguePresenter: self)
        homeModel.fetchDataFromApi(endpoint: endpoint, str: strSport)
        
    }
    
    func onSuccess(leagues: [League]) {
        leagueView.renderAllLeagues(leagues: leagues)
    }
    
    func onFailed(error: Error) {
        leagueView.postErroeInLeagues(error: error)
    }
    
    
    
}
