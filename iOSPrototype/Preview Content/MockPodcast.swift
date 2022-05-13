//
//  MockPodcast.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import Core

extension Podcast {
  static var mock: Podcast {
    let podcast = Podcast()
    podcast.title = "Stacktrace"
    podcast.subtitle = "A podcast about life and technology from two developers perspective."
    podcast.id = "any-id"

    return podcast
  }
}

