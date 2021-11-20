//
//  RealmService.swift
//  CodingChallenge
//
//  Created by  Decagon on 20/11/2021.
//

import RealmSwift
import Foundation

class RealmService {
    static let shared = RealmService()
    var realm = try! Realm()
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
                try! realm.commitWrite()
            }
        } catch {
            debugPrint(error)
        }
    }
}


