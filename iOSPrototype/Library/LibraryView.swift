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
            LibraryDetailView(
              podcast: podcast,
              unsubscribeHandler: didTapUnsubscribe
            )
          } label: {
            Text(podcast.title ?? "Missing Title")
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
}

  struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
      LibraryView()
    }
  }

  final class LibraryViewModel: ObservableObject {
    @Published private (set) var podcasts: [ManagedPodcast] = []

    private let subscriptionsService: SubscriptionsService

    init(subscriptionsService: SubscriptionsService = SubscriptionsService()) {
      self.subscriptionsService = subscriptionsService
    }

    func loadSubscriptions() {
      self.podcasts = subscriptionsService.load()
    }
  }
