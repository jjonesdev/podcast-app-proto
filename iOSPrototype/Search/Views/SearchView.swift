//
//  SearchView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI
import Core

struct SearchView: View {
  let storageProvider: StorageProvider

  var body: some View {
    NavigationView {
      SearchListView(storageProvider: storageProvider)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(storageProvider: StorageProvider())
  }
}
