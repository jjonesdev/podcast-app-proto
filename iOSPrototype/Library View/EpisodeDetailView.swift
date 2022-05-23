//
// EpisodeDetailView.swift
// iOSPrototype
//
// Created on 5/23/22
//


import SwiftUI
import Core

struct EpisodeDetailView: View {
  let episode: Episode
  
  var body: some View {
    VStack {
      Text(episode.title)
      Button {
        // play episode
      } label: {
        Text("Play")
      }.buttonStyle(.bordered)
    }
  }
}

struct EpisodeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeDetailView(episode: Episode.mock)
  }
}
