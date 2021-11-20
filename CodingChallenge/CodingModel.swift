//
//  CodingModel.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import Foundation
import UIKit
import RealmSwift


class DisplayModel {
    var title: String
    var image: String?
    var describe: String
    var liked: Bool
    
    init(title: String, image: String, describe: String, liked: Bool) {
        self.title = title
        self.image = image
        self.describe = describe
        self.liked = liked
    }
}

extension DisplayModel: Hashable {
    static func == (lhs: DisplayModel, rhs: DisplayModel) -> Bool {
        return lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(image)
    }
}

class catMod: Object {
        @objc dynamic var title: String = ""
        @objc dynamic var describe: String = ""
        @objc dynamic var image: String = ""
        @objc dynamic var liked: Bool = false
}
