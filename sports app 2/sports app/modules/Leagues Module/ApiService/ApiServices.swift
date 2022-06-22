//
//  ApiServices.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


protocol ApiServiceLeagues {
    func fetchLeaguess(endPoint : String, str : String , Completion : @escaping (([League]? , Error?) -> Void))
}
