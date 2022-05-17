//
//  LibraryDetailView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import SwiftUI
import Core

struct LibraryDetailView: View {
  let podcast: ManagedPodcast
  private let subscriptionsService = SubscriptionsService()
  private let didTapUnsubscribe: () -> Void

  init(podcast: ManagedPodcast, unsubscribeHandler: @escaping () -> Void) {
    self.podcast = podcast
    self.didTapUnsubscribe = unsubscribeHandler
  }

  var episodes: [ManagedEpisode] {
    podcast.episodes?.toArray() ?? []
  }

  var body: some View {
    List {
      ForEach(episodes) { episode in
        Text(episode.title ?? "n/a")
      }
    }
    .navigationTitle(podcast.title ?? "")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          subscriptionsService.unsubscribe(from: podcast)
          didTapUnsubscribe()
        } label: {
          Text("Unsubscribe")
        }
      }
    }
  }
}

struct LibraryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LibraryDetailView(podcast: ManagedPodcast.mock) { }
  }
}


