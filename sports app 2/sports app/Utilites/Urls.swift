//
//  Urls.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//


// all_sports.php

import Foundation

struct UrlServices {
    var endPoint : String = ""
    var url : String  {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
    
}


// https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Soccer


struct UrlServiceOfLeague {
    var endPoint : String = ""
    var url : String  {
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(endPoint)"
    }
}




