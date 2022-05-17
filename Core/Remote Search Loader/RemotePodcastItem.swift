//
//  RemotePodcastItem.swift
//  Core
//
//  Created by Jordan Jones on 4/6/22.
//

import Foundation
import FeedKit

public struct RemotePodcastItem {
  enum Error: Swift.Error {
    case missingTitle
    case missingDescription
    case missingArtworkURL
  }
  
  public let id: String
  public let title: String
  public let description: String
  public let artworkURL: URL
  public let episodes: [RemotePodcastEpisode]
  
  public init(podcast: RSSFeed) throws {
    self.id = UUID().uuidString
    
    if let title = podcast.title  {
      self.title = title
    } else if let iTunesTitle = podcast.iTunes?.iTunesTitle {
      self.title = iTunesTitle
    } else {
      throw Error.missingTitle
    }
    
    if let description = podcast.description {
      self.description = description
    } else if let iTunesSubtitle = podcast.iTunes?.iTunesSubtitle {
      self.description = iTunesSubtitle
    } else {
      throw Error.missingDescription
    }
    
    if let artworkURL = podcast.image?.url {
      self.artworkURL = URL(string: artworkURL)!
    } else if let iTunesArtworkURL = podcast.iTunes?.iTunesImage?.attributes?.href {
      self.artworkURL = URL(string: iTunesArtworkURL)!
    } else {
      throw Error.missingArtworkURL
    }
    
    do {
      let feedEpisodes = try podcast.items?.compactMap({ episode in
        return try RemotePodcastEpisode(episode: episode)
      })
      self.episodes = feedEpisodes ?? []
    } catch (let error) {
      throw error
    }
  }
}
