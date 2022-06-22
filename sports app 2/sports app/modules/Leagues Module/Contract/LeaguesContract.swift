//
//  LeaguesContract.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


protocol ILeaguesView {
    func renderAllLeagues(leagues : [League])
    func postErroeInLeagues(error : Error)
}

protocol ILeaguesPresenter{
    func fetchData(endpoint : String)
    func onSuccess(leagues : [League])
    func onFailed(error : Error)
}



protocol ILeaguesModel {
    
    func fetchDataFromApi(endpoint : String , str : String)
    
}
