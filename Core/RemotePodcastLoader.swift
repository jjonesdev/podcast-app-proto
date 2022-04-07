//
//  PodcastService.swift
//  Core
//
//  Created by Jordan Jones on 4/4/22.
//

import Foundation

public final class RemotePodcastLoader {
  private let client: HTTPClient
  
  public init(client: HTTPClient) {
    self.client = client
  }
  
  public func load(url: URL) async throws -> RemotePodcastItem {
    do {
      let data = try await client.get(url: url)
      return try RemotePodcastMapper.map(data)
    } catch (let error) {
      throw error
    }
  }
}
