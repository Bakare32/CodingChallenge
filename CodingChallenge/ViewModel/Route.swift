//
//  Route.swift
//  CodingChallenge
//
//  Created by  Decagon on 19/11/2021.
//

import Foundation


enum Route {
    static let baseUrl = "https://www.flickr.com/services/rest/?"
    
    case pickUpLocation
    
    var description: String {
        switch self {
        case .pickUpLocation:
            return "method=flickr.people.getPublicPhotos&api_key=56e779b053994c656ecbef2b4ecc9266&user_id=65789667%40N06&extras=url_m%2Cowner_name&format=json&nojsoncallback=1"
        }
    }
}
