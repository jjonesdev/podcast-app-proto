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
      LibraryView(subscriptionsProvider: SubscriptionsProvider(storageProvider: storageProvider))
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
    .overlay(alignment: .bottom) {
      CompactPlayerView()
        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
        .background(.ultraThickMaterial)
        .padding(.bottom, 49)
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView(storageProvider: StorageProvider())
  }
}
