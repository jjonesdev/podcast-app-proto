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
  @State var storageProvider = StorageProvider()

  var body: some Scene {
    WindowGroup {
      TabBarView(storageProvider: storageProvider)
        .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
    }
  }
}
