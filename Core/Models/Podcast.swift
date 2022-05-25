//
// Podcast.swift
// Core
//
// Created on 5/17/22
//


import Foundation

public struct Podcast {
  public let id: String
  public let title: String
  public let subtitle: String
  public let artworkURL: URL?
  public let episodes: [Episode]

  public var sortedEpisodes: [Episode] {
    return episodes.sorted()
  }

  public init(id: String, title: String, subtitle: String, artworkURL: URL?, episodes: [Episode]) {
    self.id = id
    self.title = title
    self.subtitle = subtitle
    self.artworkURL = artworkURL
    self.episodes = episodes
  }

  init(managedPodcast: ManagedPodcast) {
    self.id = managedPodcast.id
    self.title = managedPodcast.title
    self.subtitle = managedPodcast.subtitle
    self.artworkURL = URL(string: managedPodcast.artworkURL)
    self.episodes = managedPodcast.sortedEpisodes.map { Episode(managedEpisode: $0) }
  }
}

// MARK: - Hashable Conformance
extension Podcast: Hashable {
  public static func == (lhs: Podcast, rhs: Podcast) -> Bool {
    return lhs.id == rhs.id &&
    lhs.title == rhs.title &&
    lhs.subtitle == rhs.subtitle &&
    lhs.artworkURL == rhs.artworkURL &&
    lhs.episodes == rhs.episodes
  }
}

// MARK: - Identifiable Conformance
extension Podcast: Identifiable {}

// MARK: - Comparable Conformance
extension Podcast: Comparable {
  public static func < (lhs: Podcast, rhs: Podcast) -> Bool {
    lhs.title < rhs.title
  }
}
