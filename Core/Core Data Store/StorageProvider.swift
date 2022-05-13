//
//  StorageProvider.swift
//  Core
//
//  Created by Jordan on 5/11/22.
//

import CoreData

public class StorageProvider {
  let persistentContainer: NSPersistentContainer

  public init() {
    persistentContainer = PersistentContainer(name: "")

    persistentContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Core Data store failed to load with error: \(error)")
      }
    }
  }

  public func subscribe(to remotePodcast: RemotePodcastItem) {
    let podcast = Podcast(context: persistentContainer.viewContext)
    podcast.id = remotePodcast.id
    podcast.title = remotePodcast.title
    podcast.subtitle = remotePodcast.description
    podcast.artworkURL = remotePodcast.artworkURL.absoluteString

    for remoteEpisode in remotePodcast.episodes {
      let episode = Episode(context: persistentContainer.viewContext)
      episode.id = remoteEpisode.id
      episode.title = remoteEpisode.title
      episode.subtitle = remoteEpisode.description
      episode.audioURL = remoteEpisode.audioURL.absoluteString
      episode.length = remoteEpisode.length
      episode.audioType = remoteEpisode.audioType
      podcast.addToEpisodes(episode)
    }

    let subscriptions = Subscriptions(context: persistentContainer.viewContext)
    subscriptions.addToPodcasts(podcast)

    do {
      try persistentContainer.viewContext.save()
    } catch {
      persistentContainer.viewContext.rollback()
    }
  }

  public func getAllSubscriptions() -> [Podcast] {
    let fetchRequest: NSFetchRequest<Podcast> = Podcast.fetchRequest()

    do {
      return try persistentContainer.viewContext.fetch(fetchRequest)
    } catch {
      return []
    }
  }
}


