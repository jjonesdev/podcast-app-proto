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
  public let episodes: Set<Episode>
}

extension Podcast: Hashable {
  public static func == (lhs: Podcast, rhs: Podcast) -> Bool {
    return lhs.id == rhs.id &&
    lhs.title == rhs.title &&
    lhs.subtitle == rhs.subtitle &&
    lhs.artworkURL == rhs.artworkURL &&
    lhs.episodes == rhs.episodes
  }
}
