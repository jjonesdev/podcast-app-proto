//
//  LibraryDetailView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import SwiftUI
import Core

struct LibraryDetailView: View {
  let podcast: Podcast

  var body: some View {
    Text(podcast.title ?? "missing title")
  }
}

struct LibraryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LibraryDetailView(podcast: Podcast.mock)
  }
}


