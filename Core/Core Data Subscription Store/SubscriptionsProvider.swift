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
    try! fetchedResultsController.performFetch()
  }

  public func numberofItemsInSection(_ section: Int) -> Int {
    guard let sections = fetchedResultsController.sections, sections.endIndex > section else { return 0 }
    return sections[section].numberOfObjects
  }

  public func object(at indexPath: IndexPath) -> ManagedPodcast {
    return fetchedResultsController.object(at: indexPath)
  }
}

extension SubscriptionsProvider: NSFetchedResultsControllerDelegate {
  public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    objectWillChange.send()
  }
}
