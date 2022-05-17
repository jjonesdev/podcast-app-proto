//
// SubscriptionsService.swift
// Core
//
// Created on 5/17/22
//


import Foundation

public class SubscriptionsService {
  private let storageProvider: StorageProvider

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
