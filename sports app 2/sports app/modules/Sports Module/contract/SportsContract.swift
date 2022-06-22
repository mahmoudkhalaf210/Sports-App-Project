//
//  SportsContract.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


protocol ISportsView {
    
    func renderAllSports(sports : [Sport])
    func postErrorInSports(error : Error)
    
}


protocol ISportsPresenter {
    
    func fetchData(endPoint : String)
    func onSuccess(sports : [Sport])
    func onFailed(error : Error)
    
}


protocol ISportsModel {
    func fetchDataFromApi(endPoint : String)
}
