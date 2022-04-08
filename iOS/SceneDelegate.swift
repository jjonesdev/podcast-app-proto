//
//  SceneDelegate.swift
//  PodcastApp
//
//  Created by Jordan Jones on 4/2/22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = UIHostingController(rootView: PodcastView())
    window?.makeKeyAndVisible()
  }
}

