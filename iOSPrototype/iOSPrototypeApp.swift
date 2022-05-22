//
//  iOSApp.swift
//  iOS
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI
import Core

@main
struct iOSPrototypeApp: App {
  let storageProvider = StorageProvider.shared

  var body: some Scene {
    WindowGroup {
      TabBarView()
        .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
    }
  }
}
