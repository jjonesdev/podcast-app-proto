//
//  PodcastView.swift
//  iOS
//
//  Created by Jordan Jones on 4/8/22.
//

import SwiftUI
import Core

struct PodcastView: View {
  private let podcastLoader = RemotePodcastLoader(client: URLSessionHTTPClient())
  @State var podcast: RemotePodcastItem?
  @State var loadingError: Error?
  
  var body: some View {
    NavigationView {
      List {
        if let podcast = podcast {
          ForEach(podcast.episodes) { episode in
            HStack(spacing: 12) {
              AsyncImage(url: podcast.artworkURL) { image in
                image.resizable()
              } placeholder: {
                ProgressView()
              }
              .frame(width: 100, height: 100)
              .cornerRadius(4)
              
              VStack(alignment: .leading, spacing: 4) {
                Text(episode.title)
                  .font(.body)
                Text(episode.description)
                  .font(.subheadline)
                  .lineLimit(2)
              }
              .padding([.top, .bottom], 12)
            }
          }
        }
      }
      .navigationTitle(podcast?.title ?? "")
      .listStyle(.plain)
      .task {
        let podcastURL = URL(string: "http://localhost:3002/swiftbysundell")!
        do {
          podcast = try await podcastLoader.load(url: podcastURL)
        } catch (let error) {
          self.loadingError = error
        }
      }
    }
  }
}

//struct PodcastView_Previews: PreviewProvider {
//  static var previews: some View {
//    PodcastView()
//  }
//}
