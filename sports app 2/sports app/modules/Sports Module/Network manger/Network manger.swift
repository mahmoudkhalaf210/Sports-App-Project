//
//  Network manger.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


class NetworkManger : ApiService {
    func fetchSports(endPoint: String, Completion: @escaping (([Sport]?, Error?) -> Void)) {
        
        var ArrayOfSport = [Sport]()
        
        if let url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url){data , response , error in
                if let insideData = data {
                    print(insideData)
                    let decodedArray : Sports? = convertFromJson(data: insideData)
                    ArrayOfSport = decodedArray!.sports
                    print("decode arrray \(ArrayOfSport)")
                    Completion(ArrayOfSport,nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
        
        
    }
    
    
    
}
