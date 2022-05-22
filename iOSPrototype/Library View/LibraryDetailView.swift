//
// LibraryDetailView.swift
// iOSPrototype
//
// Created on 5/22/22
//


import SwiftUI
import Core

struct LibraryDetailView: View {
  let podcast: ManagedPodcast
  
  var body: some View {
    List(podcast.sortedEpisodes, id: \.id) { episode in
      Text(episode.title ?? "--")
    }
    .navigationTitle(Text(podcast.title ?? "--"))
  }
}

struct LibraryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LibraryDetailView(podcast: ManagedPodcast())
  }
}
