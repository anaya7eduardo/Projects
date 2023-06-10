//
//  ViewController.swift
//  AudioExample
//
//  Created by Eduardo Anaya on 12/14/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: -UIReferences
    @IBOutlet weak var headphones: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var currentSongLabel: UILabel!
    @IBOutlet weak var playItem: UIBarButtonItem!
    @IBOutlet weak var pauseItem: UIBarButtonItem!
    @IBOutlet weak var stopItem: UIBarButtonItem!
    @IBOutlet weak var restartItem: UIBarButtonItem!
    
    var player: AVAudioPlayer?
    var songPlayer = AVAudioPlayer()
    var hasBeenPaused = false
    
    //MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    //MARK: -IBActions
    @IBAction func buttonTapped(_ sender: Any) {
        buttonTappedFunc()
    }//IBAction buttonTapped
    
    @IBAction func play(_ sender: Any) {
        var currentSong = ("\((songPlayer.url?.pathComponents.last)!)")
        //print("Play Pressed")
        tintItems()
        playItem.tintColor = UIColor.purple
        songPlayer.play()
        headphones.backgroundColor = UIColor.orange.withAlphaComponent(0.35)
        currentSongLabel.isHidden = false
        currentSongLabel.text = currentSong + " is playing..."
    }
    
    @IBAction func pause(_ sender: Any) {
        var currentSong = ("\((songPlayer.url?.pathComponents.last)!)")
        //print("Pause Pressed")
        tintItems()
        pauseItem.tintColor = UIColor.green
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
        }
        headphones.backgroundColor = UIColor.yellow.withAlphaComponent(0.35)
        currentSongLabel.isHidden = false
        currentSongLabel.text = currentSong + " is paused..."
    }
    
    @IBAction func stop(_ sender: Any) {
        var currentSong = ("\((songPlayer.url?.pathComponents.last)!)")
        //print("Stop Pressed")
        tintItems()
        stopItem.tintColor = UIColor.red
        if songPlayer.isPlaying || hasBeenPaused {
            songPlayer.stop()
            songPlayer.currentTime = 0
        }
        headphones.backgroundColor = UIColor.green.withAlphaComponent(0.35)
        currentSongLabel.isHidden = false
        currentSongLabel.text = currentSong + " is stopped..."
    }
    
    @IBAction func restart(_ sender: Any) {
        var currentSong = ("\((songPlayer.url?.pathComponents.last)!)")
        //print("Restart Pressed")
        tintItems()
        playItem.tintColor = UIColor.purple
        if songPlayer.isPlaying || hasBeenPaused {
            songPlayer.stop()
            songPlayer.currentTime = 0
            songPlayer.play()
        } else {
            songPlayer.play()
        }
        headphones.backgroundColor = UIColor.orange.withAlphaComponent(0.35)
        currentSongLabel.isHidden = false
        currentSongLabel.text = currentSong + " is playing..."
    }
    
    //MARK: -Functions
    
    func setupView() {
        headphones.layer.cornerRadius = 100
        headphones.clipsToBounds = true
        button.tintColor = UIColor.orange
        button.isHidden = true
        currentSongLabel.isHidden = true
        currentSongLabel.layer.cornerRadius = currentSongLabel.frame.size.height/2.0
        currentSongLabel.layer.masksToBounds = true
        prepareSongAndSession()
        tintItems()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background2")!)
    }
    
    func buttonTappedFunc() {
        if let player = player, player.isPlaying {
            player.stop()
            button.setTitle("▶️", for: .normal)
        } else {
            button.setTitle("⏹", for: .normal)
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                let urlString = Bundle.main.path(forResource: "Gojira - Stranded", ofType: "mp3")
                
                guard let urlString = urlString else { return }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else { return }

                player.play()

            } catch {
                print("Error")
                
            }
        }
    }//ButtonTappedFunc
    
    func prepareSongAndSession() {
        do {
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Gojira - Stranded", ofType: "mp3")!))
            songPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch let sessionError {
                print(sessionError)
            }
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }//PrepareSongAndSession
    
    func tintItems() {
        playItem.tintColor = UIColor.orange
        pauseItem.tintColor = UIColor.orange
        stopItem.tintColor = UIColor.orange
        restartItem.tintColor = UIColor.orange
    }//TintItems
    
}

