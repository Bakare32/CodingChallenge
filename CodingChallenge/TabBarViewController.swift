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
        let photoViewController = PhotoViewController()
        let favouriteViewController = FavouriteViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([photoViewController, favouriteViewController], animated: true)
      guard let items = self.tabBar.items else { return }
        let names = ["Photos", "Favourites"]
      let images = ["photo", "star.circle"]
      for item in 0...1 {
        items[item].image = UIImage(systemName: images[item])
          items[item].title = names[item]
    }

        // Do any additional setup after loading the view.
    }
    
}
