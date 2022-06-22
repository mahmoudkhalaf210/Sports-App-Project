//
//  SportsModelController.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.

// from Contract >>>>>> Sports Contract >> ISportsModel Protocol
//

import Foundation


class SportsModelController : ISportsModel  {
    
    let apiService : ApiService = NetworkManger()
    let iSportsPrestenter : ISportsPresenter
    
    init(iSportsPresenter : ISportsPresenter){
        self.iSportsPrestenter = iSportsPresenter
    }
    
    
    func fetchDataFromApi(endPoint: String) {
        apiService.fetchSports(endPoint: endPoint) { sports, error in
            if let sports = sports {
                self.iSportsPrestenter.onSuccess(sports: sports)
            }
            if let error = error {
                self.iSportsPrestenter.onFailed(error: error)
            }
        }
    }
    
    
    
}
