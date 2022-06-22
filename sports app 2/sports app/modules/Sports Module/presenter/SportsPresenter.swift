//
//  SportsPresenter.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.

// from contract >>>>> ISportsPresenter
//
// from sports Model Controller to Fetch ?>>>>>>>>>

import Foundation


class SportsPresenter : ISportsPresenter {
    
    let iSportsView : ISportsView
    init(iSportsView : ISportsView){
        self.iSportsView = iSportsView
    }
    
    
    func fetchData(endPoint: String) {
        let homeModel = SportsModelController(iSportsPresenter: self)
        homeModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(sports: [Sport]) {
        iSportsView.renderAllSports(sports: sports)
    }
    
    func onFailed(error: Error) {
        iSportsView.postErrorInSports(error: error)
    }
    
    
}
