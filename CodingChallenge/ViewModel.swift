//
//  ViewModel.swift
//  CodingChallenge
//
//  Created by  Decagon on 20/11/2021.
//

import Foundation
import RealmSwift

class ViewModel {
    var items = [Photo]()
    var catData = [DisplayModel]()
    var itemNames = [String]()
    var completion: (() -> Void)?
    var completions: (() -> Void)?
    var data: [catMod] {realm.objects(catMod.self).map({ $0 })}
    let realm = try! Realm()
    func setUpNetwork() {
        NetworkService.shared.likePost {  [weak self ] result in
            switch result {
            case .success(let data):
                self?.items.append(contentsOf: data.photos.photo)
                self?.completion?()
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
    }
    
    
    func get() {
        self.catData.removeAll()
        let realmData = data
        for j in self.items {
            for i in realmData {
                self.itemNames.append(i.describe)
            }
            if self.itemNames.contains(j.title) {
                if let images = j.urlM {
                    self.catData.append(DisplayModel(title: j.title, image: images, describe: j.ownername.rawValue, liked: true))
                }
            } else {
                if let images = j.urlM {
                    self.catData.append(DisplayModel(title: j.title, image: images, describe: j.ownername.rawValue, liked: false))
                }
            }
        }
        completions?()
    }
    
    
    func delete(item: DisplayModel){
        let data = realm.objects(catMod.self).map({ $0 })
        for i in data {
            if i.image == item.image {
                RealmService.shared.delete(i)
            }
        }
    }
    
    func create(item: DisplayModel){
        let ittem = catMod()
        ittem.title = item.title
        ittem.describe = item.describe
        ittem.image = item.image ?? ""
        ittem.liked = item.liked
        RealmService.shared.create(ittem)
    }
}

