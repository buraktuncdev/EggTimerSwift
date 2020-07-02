//
//  SecondViewController.swift
//  EggTimer
//
//  Created by Burak Tunc on 2.07.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
 import AVKit

class SecondViewController: AVPlayerViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Open Video Player
        let videoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")
        let player = AVPlayer(url: videoURL!)
        self.player = player
        player.play()

        
       
    }

}
