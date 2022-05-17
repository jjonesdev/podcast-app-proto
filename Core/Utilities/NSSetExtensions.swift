//
//  NSSetExtensions.swift
//  Core
//
//  Created by Jordan on 5/13/22.
//

import Foundation

extension NSSet {
  public func toArray<T>() -> [T] {
    let array = self.map { $0 as! T }
    return array
  }
}
