//
//  ViewController.swift
//  musicBackgroundPlay
//
//  Created by Mohan K on 14/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "song", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            var audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            }
            catch{
               //
            }
        }
        catch{print(error)}
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func playBtn(_ sender: Any) {
        audioPlayer.play()
        print(audioPlayer.play())
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }else{
            
        }
    }
    
    @IBAction func repeatBtn(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }else{
            audioPlayer.play()
        }
    }
}

