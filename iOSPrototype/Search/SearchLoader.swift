//
//  SearchLoader.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import Foundation
import Core

protocol RemoteSearchService {
  func load() async throws -> RemotePodcastItem
}

final class SearchLoader: RemoteSearchService {
  private let searchLoader: RemotePodcastLoader
  private let endpoint: URL

  init(endpoint: String) {
    let client = URLSessionHTTPClient()
    self.searchLoader = RemotePodcastLoader(client: client)
    self.endpoint = URL(string: endpoint)!
  }

  func load() async throws -> RemotePodcastItem {
    do {
      let result = try await searchLoader.load(url: endpoint)
      return result
    } catch (let error) {
      throw error
    }
  }
}

