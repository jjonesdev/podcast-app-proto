//
//  TabBarView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI

struct TabBarView: View {
  var body: some View {
    TabView {
      SearchView()
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("Searh View")
        }
      LibraryView()
        .tabItem {
          Image(systemName: "square.stack")
          Text("Library")
        }
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView()
  }
}
