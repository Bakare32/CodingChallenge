//
//  FavouriteViewModel.swift
//  CodingChallenge
//
//  Created by  Decagon on 20/11/2021.
//


import Foundation

import RealmSwift

class CollectionViewModel {
    let realm = try! Realm()
    var data:[catMod]{realm.objects(catMod.self).map({ $0 })}
    var completion: (()-> Void)?
    
    func delete(index: Int) {
        let selected = data[index]
        RealmService.shared.delete(selected)
        completion?()
    }
}

