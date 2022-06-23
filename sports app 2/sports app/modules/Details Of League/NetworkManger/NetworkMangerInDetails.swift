//
//  NetworkMangerInDetails.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


class NetworkMangerInDetail : ApiServicesOfTeams{
    
    
    func fetchDataOfTeams(endPoint: String, Completion: @escaping (([Team]?, Error?) -> Void)) {
        print(urlServiceOfTeam(endPoint: endPoint).url)

        
        print(encodeUrl(url: endPoint))
        let encodedendPoint = encodeUrl(url: endPoint)
        print(urlServiceOfTeam(endPoint: encodedendPoint).url)
        
        if let url = URL(string: urlServiceOfTeam(endPoint: encodedendPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let dataInside = data {
                    print("data get ")
                    print(dataInside)
                    let decodeTeamArray : Teams? = convertFromJson(data: dataInside)
                    Completion(decodeTeamArray?.teams, error)
                }
                if let error = error {
                    print("data not get")
                    Completion(nil , error)
                }
            }.resume()
        }
    }
    
    
}
