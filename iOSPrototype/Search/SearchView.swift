//
//  SearchView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI

struct SearchView: View {
  var body: some View {
    NavigationView {
      SearchListView()
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
