//
//  SearchDetailView.swift
//  iOSPrototype
//
//  Created by Jordan on 5/1/22.
//

import SwiftUI

struct SearchDetailView: View {
  @ObservedObject private var viewModel: SearchDetailView.ViewModel

  init(viewModel: SearchDetailView.ViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    switch viewModel.viewState {
    case .idle:
      Text("Idle")
        .foregroundColor(.gray)
    case .loading:
      Text("Loading")
        .foregroundColor(.yellow)
    case .loaded:
      Text("Loaded")
        .foregroundColor(.green)
    case .error:
      Text("Error")
        .foregroundColor(.red)
    }
  }
}
