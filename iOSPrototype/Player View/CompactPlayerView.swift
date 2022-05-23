//
// CompactPlayerView.swift
// iOSPrototype
//
// Created on 5/23/22
//


import SwiftUI

struct CompactPlayerView: View {
  @State var isPlaying = false
  var body: some View {
    HStack(alignment: .bottom) {
      Text("Episode Title")
      Spacer()
      if isPlaying {
        Button {
          // pause playback
        } label: {
          Image(systemName: "pause.fill")
        }
      } else {
        Button {
          // play episode
        } label: {
          Image(systemName: "play.fill")
        }
      }
    }
    .padding(.horizontal, 20)
  }
}

struct CompactPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    CompactPlayerView()
  }
}
