

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progreeBarView: UIProgressView!
    var eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var result: Int?
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var audioPlayer : AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progreeBarView.progress = 1.0
        
    }
 
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!  // Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        progreeBarView.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progreeBarView.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            titleLabel.text = "Done"
            playAudioFromURL()
            timer.invalidate()
        }
        
    }
    
    // Play Audio From Bundle
    private func playAudioFromProject() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            print("Error to get The mp3 file")
            return
        }
        do {
            audioPlayer = try AVPlayer(url: url)
        } catch{
            print("Audio File Error")
        }
        audioPlayer.play()
    }
    
    // Play Audio From URL
    private func playAudioFromURL() {
          guard let url = URL(string: "https://geekanddummy.com/wp-content/uploads/2014/01/coin-spin-light.mp3") else {
              print("error to get the mp3 file")
              return
          }
          do {
              audioPlayer = try AVPlayer(url: url as URL)
          } catch{
              print("audio file error")
          }
          audioPlayer?.play()
        
         performSegue(withIdentifier: "secondSegueIdentifier", sender: nil)
      }
    
}



