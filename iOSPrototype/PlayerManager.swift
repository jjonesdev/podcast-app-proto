//
// PlayerManager.swift
// iOSPrototype
//
// Created on 5/23/22
//


import Foundation
import AVKit
import SwiftUI
import Core

final class PlayerManager: ObservableObject {
  private let player = AVPlayer()
  @Published var isPlaying = false
  @Published var episode: Episode? = nil

  func play(_ episode: Episode) {
    self.episode = episode
    let item = AVPlayerItem(url: episode.audioURL)
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
