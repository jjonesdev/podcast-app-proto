//
// SubscriptionsProvider.swift
// Core
//
// Created on 5/22/22
//


import Foundation
import CoreData

public class SubscriptionsProvider: NSObject, ObservableObject {
  private let fetchedResultsController: NSFetchedResultsController<ManagedPodcast>

  public var numberOfSections: Int {
    return fetchedResultsController.sections?.count ?? 0
  }

  public init(storageProvider: StorageProvider) {
    let request = ManagedPodcast.subscriptionsRequest
    self.fetchedResultsController = NSFetchedResultsController(
      fetchRequest: request,
      managedObjectContext: storageProvider.persistentContainer.viewContext,
      sectionNameKeyPath: nil,
      cacheName: nil
    )

    super.init()

    fetchedResultsController.delegate = self
    do {
      try fetchedResultsController.performFetch()
    } catch {
      print("Failed to perform fetch: \(error)")
    }
  }

  public func numberofItemsInSection(_ section: Int) -> Int {
    guard let sections = fetchedResultsController.sections, sections.endIndex > section else { return 0 }
    return sections[section].numberOfObjects
  }

  public func object(at indexPath: IndexPath) -> ManagedPodcast {
    return fetchedResultsController.object(at: indexPath)
  }

  public func object(at indexPath: IndexPath) -> Podcast {
    let managedPodcast = fetchedResultsController.object(at: indexPath)

    return Podcast(
      id: managedPodcast.id,
      title: managedPodcast.title,
      subtitle: managedPodcast.subtitle,
      artworkURL: URL(string: managedPodcast.artworkURL),
      episodes: managedPodcast.sortedEpisodes.map { Episode(managedEpisode: $0) }
    )
  }
}

extension SubscriptionsProvider: NSFetchedResultsControllerDelegate {
  public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    objectWillChange.send()
  }
}
