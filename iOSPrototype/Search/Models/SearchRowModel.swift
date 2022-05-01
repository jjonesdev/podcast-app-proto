//
//  SearchModel.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import Foundation

struct SearchRowModel: Identifiable {
  let id = UUID()
  let title: String
  let endpoint: String
}

extension SearchRowModel {
  static func makePrototypeModels() -> [SearchRowModel] {
    [
      SearchRowModel(
        title: "Accidental Tech Podcast",
        endpoint: makeEndpoint(for: "atp")
      ),
      SearchRowModel(
        title: "Stacktrace",
        endpoint: makeEndpoint(for: "stacktrace")
      ),
      SearchRowModel(
        title: "Swift by Sundell",
        endpoint: makeEndpoint(for: "swiftbysundell")
      ),
      SearchRowModel(
        title: "Syntax",
        endpoint: makeEndpoint(for: "syntax")
      ),
    ]
  }

  private static func makeEndpoint(for path: String) -> String {
    return "http://localhost:3002/\(path)"
  }
}
