//
//  File.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation



class NetworkMangerInLeague : ApiServiceLeagues {
    func fetchLeaguess(endPoint: String, Completion: @escaping (([League]?, Error?) -> Void)) {
        
        print(UrlServiceOfLeague(endPoint: endPoint).url)
        
        if let url = URL(string: UrlServiceOfLeague(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url){data , response , error in
                if let insideData = data {
                    let decodedArray : Leagues! = convertFromJson(data: insideData)
                    Completion(decodedArray.countries,nil)
                    }
                if let errorInside =  error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
        
        
    }
    

}
