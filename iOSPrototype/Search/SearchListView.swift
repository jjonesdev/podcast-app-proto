//
//  SearchList.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI

struct SearchListView: View {
  private let store: [SearchRowModel] = SearchRowModel.makePrototypeModels()

  var body: some View {
    List {
      ForEach(store, id: \.id) { model in
        makeRow(from: model)
      }
    }
    .navigationTitle("Search")
  }

  private func makeRow(from model: SearchRowModel) -> some View {
    NavigationLink(model.title) {
      SearchDetailView()
        .navigationTitle(model.title)
    }
  }
}

struct SearchList_Previews: PreviewProvider {
  static var previews: some View {
    SearchListView()
  }
}
