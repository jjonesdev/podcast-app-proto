//
//  TabBarView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI
import Core

struct TabBarView: View {
  let storageProvider: StorageProvider

  var body: some View {
    TabView {
      Text("Library View")
        .tabItem {
          Image(systemName: "square.stack")
          Text("Library")
        }
      SearchView(storageProvider: storageProvider)
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("Searh View")
        }
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView(storageProvider: StorageProvider())
  }
}
