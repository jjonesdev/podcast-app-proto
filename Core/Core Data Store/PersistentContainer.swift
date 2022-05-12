//
//  PersistenceContainer.swift
//  Core
//
//  Created by Jordan on 5/11/22.
//

import CoreData

/// Subclassing `NSPersistentContainer` so it looks for the xcdatamodel in the framework bundle rather than the app/main bundle.
class PersistentContainer: NSPersistentContainer {}
