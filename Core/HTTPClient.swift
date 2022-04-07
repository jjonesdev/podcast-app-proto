//
//  HTTPClient.swift
//  Core
//
//  Created by Jordan Jones on 4/2/22.
//

import Foundation

public protocol HTTPClient {
  func get(url: URL) async throws -> Data
}
