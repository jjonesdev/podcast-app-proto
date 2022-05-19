//
//  MockPodcast.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import Core

extension Podcast {
  static var mock: Podcast {
    return Podcast(id: "any-id", title: "Podcast Title", subtitle: "Podcast Subtitle", artworkURL: URL(string: "https://any-url.com"), episodes: [])
  }
}

