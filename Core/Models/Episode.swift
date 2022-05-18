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
  public let length: Int
  public let audioURL: URL
  public let audioType: String
}

extension Episode: Hashable {
  public static func == (lhs: Episode, rhs: Episode) -> Bool {
    return lhs.id == rhs.id &&
    lhs.title == rhs.title &&
    lhs.subtitle == rhs.subtitle &&
    lhs.length == rhs.length &&
    lhs.audioURL == rhs.audioURL &&
    lhs.audioType == rhs.audioType
  }
}
