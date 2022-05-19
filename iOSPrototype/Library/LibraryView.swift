//
//  LibraryView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import SwiftUI
import Core

struct LibraryView: View {
  @ObservedObject private var viewModel = LibraryViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.podcasts) { podcast in
          NavigationLink {
            makeLibraryDetailView(for: podcast)
          } label: {
            Text(podcast.title)
          }
        }
      }
      .navigationTitle("Library")
    }
    .onAppear {
      viewModel.loadSubscriptions()
    }
  }

  func didTapUnsubscribe() {
    viewModel.loadSubscriptions()
  }

  @ViewBuilder
  func makeLibraryDetailView(for podcast: Podcast) -> some View {
    let viewModel = LibraryDetailView.ViewModel(podcast: podcast)
    LibraryDetailView(viewModel: viewModel, unsubscribeHandler: didTapUnsubscribe)
  }
}

  struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
      LibraryView()
    }
  }

  final class LibraryViewModel: ObservableObject {
    @Published private (set) var podcasts: [Podcast] = []

    private let subscriptionsService: SubscriptionsService

    init(subscriptionsService: SubscriptionsService = SubscriptionsService()) {
      self.subscriptionsService = subscriptionsService
    }

    func loadSubscriptions() {
      self.podcasts = subscriptionsService.load().sorted()
    }
  }
