//
//  File.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation



class NetworkMangerInLeague : ApiServiceLeagues {
    func fetchLeaguess(endPoint: String, str : String, Completion: @escaping (([League]?, Error?) -> Void)) {
        
        // test
        var finishArrayOfData = [League]()
        var ArrayOfLeague = [League]()
        if let url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url){data , response , error in
                if let insideData = data {
                    let decodedArray : Leagues? = convertFromJson(data: insideData)
                    ArrayOfLeague = decodedArray!.leagues
                    print("array of leagues")
                    print(ArrayOfLeague)
                    for item in ArrayOfLeague {
                        if item.strSport == str{
                            finishArrayOfData.append(item)
                        }
                    }
                    print("decode arrray \(finishArrayOfData)")
                    Completion(finishArrayOfData,nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
        
        
    }
    
}
