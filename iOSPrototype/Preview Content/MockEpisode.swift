//
// MockEpisode.swift
// iOSPrototype
//
// Created on 5/23/22
//


import Foundation
import Core

extension Episode {
  static var mock: Episode {
    return Episode(
      id: "any-id",
      title: "Episode Title",
      subtitle: "Episode Subtitle",
      length: 12345,
      audioURL: URL(string: "https://any-url.com")!,
      audioType: "mp3",
      publishDate: Date()
    )
  }
}
