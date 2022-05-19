//
//  LibraryDetailView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import SwiftUI
import Core

struct LibraryDetailView: View {
  @ObservedObject private var viewModel: ViewModel

  private let subscriptionsService = SubscriptionsService()
  private let didTapUnsubscribe: () -> Void

  init(viewModel: ViewModel, unsubscribeHandler: @escaping () -> Void) {
    self.viewModel = viewModel
    self.didTapUnsubscribe = unsubscribeHandler
  }

  var body: some View {
    List {
      ForEach(viewModel.episodes) { episode in
        Text(episode.title)
      }
    }
    .navigationTitle(viewModel.podcastTitle)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
//          subscriptionsService.unsubscribe(from: podcast)
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
    LibraryDetailView(viewModel: .init(podcast: Podcast.mock)) { }
  }
}

extension LibraryDetailView {
  final class ViewModel: ObservableObject {
    private let podcast: Podcast

    @Published private(set) var episodes: [Episode] = []

    var podcastTitle: String {
      podcast.title
    }

    init(podcast: Podcast) {
      self.podcast = podcast
      self.episodes = podcast.episodes.sorted()
    }
  }
}


