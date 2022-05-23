//
// ManagedPodcast.swift
// Core
//
// Created on 5/22/22
//


import Foundation
import CoreData

public class ManagedPodcast: NSManagedObject, Identifiable {
  @NSManaged public var id: String
  @NSManaged public var title: String
  @NSManaged public var subtitle: String
  @NSManaged public var artworkURL: String
  @NSManaged public var episodes: Set<ManagedEpisode>

  public static var subscriptionsRequest: NSFetchRequest<ManagedPodcast> {
    let request: NSFetchRequest<ManagedPodcast> = ManagedPodcast.fetchRequest()

    request.sortDescriptors = [
      NSSortDescriptor(keyPath: \ManagedPodcast.title, ascending: true)
    ]

    request.fetchBatchSize = 15
    request.relationshipKeyPathsForPrefetching = [
      #keyPath(ManagedPodcast.episodes)
    ]

    return request
  }

  public var sortedEpisodes: Array<ManagedEpisode> {
    return Array(episodes).sorted { lhs, rhs in
      return rhs.publishDate < lhs.publishDate
    }
  }

  public static func fetchRequest() -> NSFetchRequest<ManagedPodcast> {
    return NSFetchRequest<ManagedPodcast>(entityName: "ManagedPodcast")
  }
}
