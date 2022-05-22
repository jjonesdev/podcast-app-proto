//
// LibraryView.swift
// iOSPrototype
//
// Created on 5/22/22
//


import SwiftUI
import Core

struct LibraryView: View {
  @ObservedObject var subscriptionsProvider: SubscriptionsProvider
  
  var body: some View {
    NavigationView {
      List(0..<subscriptionsProvider.numberofItemsInSection(0), id: \.self) { index in
        let podcast = subscriptionsProvider.object(at: IndexPath(item: index, section: 0))
        NavigationLink {
          LibraryDetailView(podcast: podcast)
        } label: {
          Text(podcast.title)
        }
      }
      .navigationTitle(Text("Library"))
    }
  }
}

struct LibraryView_Previews: PreviewProvider {
  static var previews: some View {
    LibraryView(subscriptionsProvider: SubscriptionsProvider(storageProvider: StorageProvider()))
  }
}
