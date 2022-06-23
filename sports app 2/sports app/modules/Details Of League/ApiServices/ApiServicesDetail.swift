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
