//
// Episode.swift
// Core
//
// Created on 5/17/22
//


import Foundation

public struct Episode {
  public let id: String
  public let title: String
  public let subtitle: String
  public let length: Int64
  public let audioURL: URL
  public let audioType: String?
  public let publishDate: Date

  public init(id: String, title: String, subtitle: String, length: Int64, audioURL: URL, audioType: String?, publishDate: Date) {
    self.id = id
    self.title = title
    self.subtitle = subtitle
    self.length = length
    self.audioURL = audioURL
    self.audioType = audioType
    self.publishDate = publishDate
  }
}

// MARK: - Hashable Conformance
extension Episode: Hashable {
  public static func == (lhs: Episode, rhs: Episode) -> Bool {
    return lhs.id == rhs.id &&
    lhs.title == rhs.title &&
    lhs.subtitle == rhs.subtitle &&
    lhs.length == rhs.length &&
    lhs.audioURL == rhs.audioURL &&
    lhs.audioType == rhs.audioType &&
    lhs.publishDate == rhs.publishDate
  }
}

// MARK: - Identifiable Conformance
//  - Episode automatically conforms to `Identifiable` because it has an `id` property
extension Episode: Identifiable {}

// MARK: - Comparable Conformance
extension Episode: Comparable {
  public static func < (lhs: Episode, rhs: Episode) -> Bool {
    rhs.publishDate < lhs.publishDate
  }
}
