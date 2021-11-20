//
//  String + extension.swift
//  CodingChallenge
//
//  Created by  Decagon on 19/11/2021.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
