//
//  TabBarView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI
import Core

struct TabBarView: View {
  @StateObject var playerManager = PlayerManager()

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
    .environmentObject(playerManager)
    .overlay(alignment: .bottom) {
      if let episode = playerManager.episode {
        CompactPlayerView(title: episode.title)
          .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
          .background(.ultraThickMaterial)
          .padding(.bottom, 49)
          .environmentObject(playerManager)
      }
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView(storageProvider: StorageProvider())
  }
}
