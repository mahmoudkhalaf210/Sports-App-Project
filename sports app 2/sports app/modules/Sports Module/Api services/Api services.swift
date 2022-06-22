//
//  Api services.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation

protocol ApiService {
    func fetchSports(endPoint : String , Completion : @escaping (([Sport]? , Error?) -> Void))
}




