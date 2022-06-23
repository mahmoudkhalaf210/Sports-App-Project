//
//  URlEncode.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation

func encodeUrl(url : String) -> String {
    let escapedString = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    return escapedString!
}
