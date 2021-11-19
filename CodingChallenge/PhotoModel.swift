//
//  PhotoModel.swift
//  CodingChallenge
//
//  Created by  Decagon on 19/11/2021.
//

import Foundation

struct CompetetionDTO: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id: String
    let owner: Owner
    let secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let ownername: Ownername
    let urlM: String
    let heightM, widthM: Int

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, ownername
        case urlM = "url_m"
        case heightM = "height_m"
        case widthM = "width_m"
    }
}

enum Owner: String, Codable {
    case the65789667N06 = "65789667@N06"
}

enum Ownername: String, Codable {
    case vagelisPikoulas = "Vagelis Pikoulas"
}
