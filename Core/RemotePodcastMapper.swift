//
//  RemotePodcastMapper.swift
//  Core
//
//  Created by Jordan Jones on 4/6/22.
//

import Foundation
import FeedKit

struct RemotePodcastMapper {
  enum Error: Swift.Error {
    case missingRSSFeed
    case failedToParseFeed
  }
  
  static func map(_ data: Data) throws -> RemotePodcastItem {
    let xmlParser = FeedParser(data: data)
    let result = xmlParser.parse()
    
    switch result {
    case .success(let feed):
      do { return try map(feed) }
      catch (let error) { throw error }
    case .failure:
      throw Error.failedToParseFeed
    }
  }
  
  private static func map(_ feed: Feed) throws -> RemotePodcastItem {
    switch feed {
    case .rss(let feed):
      do {
        return try RemotePodcastItem(podcast: feed)
      } catch (let error) {
        throw error
      }
    default:
      throw Error.missingRSSFeed
    }
  }
}
