//
//  LibraryView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/12/22.
//

import SwiftUI
import Core

struct LibraryView: View {
  @ObservedObject private var viewModel = LibraryViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.podcasts) { podcast in
          NavigationLink {
            LibraryDetailView(podcast: podcast)
          } label: {
            Text(podcast.title ?? "Missing Title")
          }
        }
      }
      .navigationTitle("Library")
    }
    .onAppear {
      viewModel.getSubscriptions()
    }
  }
}

  struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
      LibraryView()
    }
  }

  final class LibraryViewModel: ObservableObject {
    @Published private (set) var podcasts: [Podcast] = []

    private let storageProvider: StorageProvider

    init(storageProvider: StorageProvider = StorageProvider.shared) {
      self.storageProvider = storageProvider
    }

    func getSubscriptions() {
      self.podcasts = storageProvider.getAllSubscriptions()
    }
  }
