//
//  RemotePodcastEpisode.swift
//  Core
//
//  Created by Jordan Jones on 4/6/22.
//

import Foundation
import FeedKit

public struct RemotePodcastEpisode: Identifiable {
  enum Error: Swift.Error {
    case missingTitle
    case missingDescription
    case missingAudioURL
    case missingLength
    case missingAudioType
    case missingPublishDate
  }
  
  public let id: String
  public let title: String
  public let description: String
  public let audioURL: URL
  public let length: Int64
  public let audioType: String?
  public let publishDate: Date
  
  public init(episode: RSSFeedItem) throws {
    self.id = episode.guid?.value ?? UUID().uuidString
    
    if let title = episode.title {
      self.title = title
    } else if let iTunesTitle = episode.iTunes?.iTunesTitle {
      self.title = iTunesTitle
    } else {
      throw Error.missingTitle
    }
    
    if let description = episode.description {
      self.description = description
    } else if let iTunesSubtitle = episode.iTunes?.iTunesSubtitle {
      self.description = iTunesSubtitle
    } else {
      throw Error.missingDescription
    }
    
    if let audioURL = episode.enclosure?.attributes?.url {
      self.audioURL = URL(string: audioURL)!
    } else {
      throw Error.missingAudioURL
    }
    
    if let length = episode.enclosure?.attributes?.length {
      self.length = length
    } else if let iTunesLength = episode.iTunes?.iTunesDuration {
      self.length = Int64(iTunesLength)
    } else {
      throw Error.missingLength
    }
    
    if let audioType = episode.enclosure?.attributes?.type {
      self.audioType = audioType
    } else {
      self.audioType = nil
    }

    if let publishDate = episode.pubDate {
      self.publishDate = publishDate
    } else {
      throw Error.missingPublishDate
    }
  }
}
