//
//  StorageProvider.swift
//  Core
//
//  Created by Jordan on 5/11/22.
//

import CoreData

public class StorageProvider {
  public static let shared = StorageProvider()
  public let persistentContainer: NSPersistentContainer

  private init() {
    persistentContainer = PersistentContainer(name: "CoreDataSubscriptionStore")

    persistentContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Core Data store failed to load with error: \(error)")
      }
    }
  }

  public func create(_ remotePodcast: RemotePodcastItem) {
    let podcast = ManagedPodcast(context: persistentContainer.viewContext)
    podcast.id = remotePodcast.id
    podcast.title = remotePodcast.title
    podcast.subtitle = remotePodcast.description
    podcast.artworkURL = remotePodcast.artworkURL.absoluteString

    for remoteEpisode in remotePodcast.episodes {
      let episode = ManagedEpisode(context: persistentContainer.viewContext)
      episode.id = remoteEpisode.id
      episode.title = remoteEpisode.title
      episode.subtitle = remoteEpisode.description
      episode.audioURL = remoteEpisode.audioURL.absoluteString
      episode.length = remoteEpisode.length
      episode.audioType = remoteEpisode.audioType
      episode.publishDate = remoteEpisode.publishDate
      podcast.addToEpisodes(episode)
    }
    
    do {
      try persistentContainer.viewContext.save()
    } catch {
      persistentContainer.viewContext.rollback()
    }
  }

  public func delete(_ podcast: ManagedPodcast) {
    persistentContainer.viewContext.delete(podcast)

    do {
      try persistentContainer.viewContext.save()
    } catch {
      persistentContainer.viewContext.rollback()
      print("Failed to save context: \(error)")
    }
  }

  public func getAllSubscriptions() -> [ManagedPodcast] {
    let fetchRequest: NSFetchRequest<ManagedPodcast> = ManagedPodcast.fetchRequest()

    do {
      return try persistentContainer.viewContext.fetch(fetchRequest)
    } catch {
      return []
    }
  }
}
