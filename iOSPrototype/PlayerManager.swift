//
// PlayerManager.swift
// iOSPrototype
//
// Created on 5/23/22
//


import Foundation
import AVKit
import SwiftUI

final class PlayerManager: ObservableObject {
  private let player = AVPlayer()

  @Published var isPlaying = false

  func play(episode url: URL) {
    let item = AVPlayerItem(url: url)
    player.replaceCurrentItem(with: item)
    player.play()
    isPlaying = true
  }

  func pause() {
    player.pause()
    isPlaying = false
  }

  func resume() {
    player.play()
    isPlaying = true
  }
}
