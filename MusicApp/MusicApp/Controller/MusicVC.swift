//
//  MusicVC.swift
//  MusicApp
//
//  Created by Abduraxmon on 29/01/23.
//

import UIKit
import AVFoundation

class MusicVC: UIViewController {
    
    
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var playerName: UILabel!

    @IBOutlet weak var volumeController: UISlider!
    
    var position = 0
    var songs = [Song]()
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        volumeController.value = 0.5
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
        
    }
    
    func configure() {
        let song = songs[position]
        
        
        musicImage.image = UIImage(named: songs[position].imageNmae)
        musicName.text = songs[position].trackName
        playerName.text = songs[position].albumName
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            
            player.volume = volumeController.value
            //player.play()
        }
        catch {
            print("Error occured")
        }
        
        volumeController.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
    
    @IBAction func playBtnPressed(_ sender: UIButton) {
        if player?.isPlaying == true {
            playBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player?.pause()
        } else {
            DispatchQueue.main.async {
                self.player?.play()
            }
            playBtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        }
    }
    
    @IBAction func backwordPressed(_ sender: Any) {
        playBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        if position > 0 {
            position -= 1
            configure()
        }
    }
    
    
    
    @IBAction func forwardPressed(_ sender: Any) {
        playBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        if position < songs.count - 1 {
            position += 1
            configure()
        }
    }
    
    
    
    
    

}
