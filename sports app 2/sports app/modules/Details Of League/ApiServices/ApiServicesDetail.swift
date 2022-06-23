//
//  File.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


protocol ApiServicesOfTeams {
    func fetchDataOfTeams(endPoint : String , Completion: @escaping (([Team]? , Error?) -> Void ))
}


protocol ApiServicesOfEvents {
    func fetchDataOfEvents(endPoint : String , Completion : @escaping (([Event]? , Error?) ->Void ) )
}

protocol ApiServicesOfLatestResult {
    func fetchDataOFResults(endPoint : String , Completion : @escaping (([Event]? , Error?) -> Void))
}
