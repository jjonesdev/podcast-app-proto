//
//  SearchList.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI
import Core

struct SearchListView: View {
  private let store: [SearchRowModel] = SearchRowModel.prototypeModels

  var body: some View {
    List {
      ForEach(store, id: \.id) { model in
        makeRow(from: model)
      }
    }
    .navigationTitle("Search")
  }

  @MainActor private func makeRow(from model: SearchRowModel) -> some View {
    let loader = SearchLoader(endpoint: model.endpoint)
    let viewModel = SearchDetailView.ViewModel(searchLoader: loader)

    return NavigationLink(model.title) {
      SearchDetailView(viewModel: viewModel)
        .navigationTitle(model.title)
        .onAppear { Task { await viewModel.load() } }
    }
  }
}

struct SearchList_Previews: PreviewProvider {
  static var previews: some View {
    SearchListView()
  }
}
