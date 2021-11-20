//
//  TabVarViewController.swift
//  CodingChallenge
//
//  Created by  Decagon on 19/11/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: PhotoViewController())
                let vc2 = UINavigationController(rootViewController: FavouriteViewController())

                viewControllers = [vc1, vc2]
      guard let items = self.tabBar.items else { return }
        let names = ["Photos", "Favourites"]
      let images = ["photo", "star.circle"]
      for item in 0...1 {
        items[item].image = UIImage(systemName: images[item])
          items[item].title = names[item]
    }
    }
    
}
