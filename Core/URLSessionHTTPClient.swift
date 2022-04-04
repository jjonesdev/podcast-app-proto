//
//  URLSessionHTTPClient.swift
//  Core
//
//  Created by Jordan Jones on 4/2/22.
//

import Foundation

final class URLSessionHTTPClient: HTTPClient {
  enum Error: Swift.Error {
    case non200HTTPStatusCode
    case connectivity
  }
  
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func get(url: URL) async throws -> Data {
    do {
      let (data, httpResponse) = try await session.data(from: url)
      guard let httpResponse = httpResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw Error.non200HTTPStatusCode
      }
      return data
    } catch {
      throw Error.connectivity
    }
  }
}
