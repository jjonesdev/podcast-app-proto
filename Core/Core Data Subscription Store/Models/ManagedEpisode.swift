//
// ManagedEpisode.swift
// Core
//
// Created on 5/23/22
//


import Foundation
import CoreData

public class ManagedEpisode: NSManagedObject, Identifiable {
  @NSManaged public var id: String
  @NSManaged public var title: String
  @NSManaged public var subtitle: String
  @NSManaged public var audioURL: String
  @NSManaged public var audioType: String?
  @NSManaged public var length: Int64
  @NSManaged public var publishDate: Date
}
