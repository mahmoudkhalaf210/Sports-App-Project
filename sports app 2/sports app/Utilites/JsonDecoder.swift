//
//  JsonDecoder.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import Foundation


func convertFromJson<T: Codable>(data : Data) -> T? {
    print("decode data")
    let jsonDecoder = JSONDecoder()
    let decodeArray = try? jsonDecoder.decode(T.self, from: data)
    return decodeArray
}
