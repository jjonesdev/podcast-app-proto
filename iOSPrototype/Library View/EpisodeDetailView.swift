//
// EpisodeDetailView.swift
// iOSPrototype
//
// Created on 5/23/22
//


import SwiftUI
import Core

struct EpisodeDetailView: View {
  @EnvironmentObject var playerManager: PlayerManager
  let episode: Episode
  
  var body: some View {
    VStack {
      Text(episode.title)
      Button {
        playerManager.play(episode: episode.audioURL)
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
