//
// SubscriptionsService.swift
// Core
//
// Created on 5/17/22
//


import Foundation
import CoreData

public class SubscriptionsService {
  private let storageProvider: StorageProvider

  public var viewContext: NSManagedObjectContext {
    return storageProvider.persistentContainer.viewContext
  }

  public init() {
    self.storageProvider = StorageProvider.shared
  }

  init(storageProvider: StorageProvider = StorageProvider.shared) {
    self.storageProvider = storageProvider
  }

  public func load() -> Set<Podcast> {
    return map(storageProvider.getAllSubscriptions())
  }

  public func subscribe(to podcast: RemotePodcastItem) {
    storageProvider.subscribe(to: podcast)
  }

  public func unsubscribe(from podcast: ManagedPodcast) {
    storageProvider.unsubscribe(from: podcast)
  }

  private func map(_ managedPodcasts: [ManagedPodcast]) -> Set<Podcast> {
    var podcasts: Set<Podcast> = []
    let episodeOrder = NSSortDescriptor(key: "publishDate", ascending: false)

    for managedPodcast in managedPodcasts {
      guard
        let id = managedPodcast.id,
        let title = managedPodcast.title,
        let subtitle = managedPodcast.subtitle,
        let artworkURL = managedPodcast.artworkURL,
        let episodes = managedPodcast.episodes
      else { return [] }

      let sortedEpisodes = episodes.sortedArray(using: [episodeOrder]).map { value -> Episode in
        let e = value as! ManagedEpisode
        return Episode(
          id: e.id!,
          title: e.title!,
          subtitle: e.subtitle!,
          length: Int(e.length),
          audioURL: URL(string: e.audioURL!)!,
          audioType: e.audioType!,
          publishDate: e.publishDate!
        )
      }

      let podcast = Podcast(
        id: id,
        title: title,
        subtitle: subtitle,
        artworkURL: URL(string: artworkURL),
        episodes: Set<Episode>(sortedEpisodes.map { $0})
      )

      podcasts.insert(podcast)
    }

    return podcasts
  }
}
