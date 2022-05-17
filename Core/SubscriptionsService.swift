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

  public func load() -> [ManagedPodcast] {
    return storageProvider.getAllSubscriptions()
  }

  public func subscribe(to podcast: RemotePodcastItem) {
    storageProvider.subscribe(to: podcast)
  }

  public func unsubscribe(from podcast: ManagedPodcast) {
    storageProvider.unsubscribe(from: podcast)
  }
}
