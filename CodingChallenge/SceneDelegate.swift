//
//  SceneDelegate.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
      guard let windowScene = (scene as? UIWindowScene) else { return }
      let homeViewController = TabBarViewController()
      let navigationController = UINavigationController(rootViewController: homeViewController)
      navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationController.navigationBar.shadowImage = UIImage()
      window = UIWindow(frame: windowScene.coordinateSpace.bounds)
      window?.windowScene = windowScene
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()

  }


}

