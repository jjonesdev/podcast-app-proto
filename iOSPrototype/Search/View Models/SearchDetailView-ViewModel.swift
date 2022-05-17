//
//  SearchDetailView-ViewModel.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import Foundation
import Core

extension SearchDetailView {
  @MainActor final class ViewModel: ObservableObject {
    enum ViewState {
      case idle
      case loading
      case loaded(RemotePodcastItem)
      case error(Error)
    }

    @Published private (set) var viewState: ViewState = .idle

    private let searchLoader: RemoteSearchService
    private let subscriptionsService: SubscriptionsService

    init(searchLoader: RemoteSearchService, subscriptionsService: SubscriptionsService = SubscriptionsService()) {
      self.searchLoader = searchLoader
      self.subscriptionsService = subscriptionsService
    }

    func load() async {
      self.viewState = .loading
      do {
        let data = try await searchLoader.load()
        self.viewState = .loaded(data)
      } catch (let error) {
        self.viewState = .error(error)
      }
    }

    func subscribe(to podcast: RemotePodcastItem) {
      subscriptionsService.subscribe(to: podcast)
    }
  }
}
