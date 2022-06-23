//
//  EventNetworkManger.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation

class EventNetworkMangerInDetail : ApiServicesOfEvents {
    
    
    func fetchDataOfEvents(endPoint: String, Completion: @escaping (([Event]?, Error?) -> Void)) {
        if let url = URL(string: UrlServiceOfEvent(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    let decodeArray : Events! = convertFromJson(data: insideData)
                    Completion(decodeArray.events, nil)
                }else{
                    Completion(nil , error)
                }
            }.resume()
        }
    }
    
    
    
}
