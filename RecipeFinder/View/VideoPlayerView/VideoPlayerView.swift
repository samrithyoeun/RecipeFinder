//
//  VideoPlayerView.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
  
  @IBOutlet private weak var playButton: UIButton?
  @IBOutlet private weak var thumbnailImageView: UIImageView?
  
  var videoURL: String?
  var player: AVPlayer?
  var playerLayer: AVPlayerLayer?
  
  private var isPlaying: Bool = false
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  func setup() {
    
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: "VideoPlayerView", bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    
    view.frame = bounds
    view.backgroundColor = .white
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
    layoutSubviews()
    
    playerLayer = AVPlayerLayer()
    playerLayer?.frame = self.frame
    playerLayer?.isHidden = true
    playerLayer?.contentsGravity = .resizeAspectFill
    playerLayer?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    
    layer.addSublayer(playerLayer!)
    clipsToBounds = true
    
  }
  
  func bind(urlString: String?, thumbnailUrl: String?) {
    guard let urlString = urlString,
          let thumbnailUrl = thumbnailUrl else {
      return
    }

    thumbnailImageView?.loadImageFrom(urlString: thumbnailUrl)

    if let url = URL(string: urlString) {
      player = AVPlayer(url: url)
      playerLayer?.player = player
    }
    
  }
  
  @IBAction func playButtonDidTapped(sender: UIButton) {
    isPlaying.toggle()
    thumbnailImageView?.isHidden = isPlaying
    playerLayer?.isHidden = !isPlaying
    isPlaying ? player?.play() : player?.pause()
    
  }
  
}
