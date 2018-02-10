//
//  audioVideoViewController.swift
//  Swift3Demo
//
//  Created by agile on 15/05/17.
//  Copyright © 2017 agile. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class audioVideoViewController: UIViewController,UINavigationControllerDelegate
,AVAudioPlayerDelegate
{
    
    
    
    var audioPlayer: AVAudioPlayer? = AVAudioPlayer()
    
    var videoURL: NSURL? = nil
    var videoPlayer: AVPlayer? = AVPlayer()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       
        
        
        
    }
    //    MARK: - Other Methods
    
    func loadVideo()
    {
        
       // let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "", ofType: "wav")!)
        
        videoURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "demo", ofType: "mov")!)
        
        videoPlayer = AVPlayer(url: videoURL! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = videoPlayer
        
        
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
 
        
        /*
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        let player = AVPlayer(url: videoURL!)
        
       NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        let playerLayer = AVPlayerLayer(player: player)
    
        playerLayer.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        
        self.view.layer.addSublayer(playerLayer)
        
        
      
        
        // if video ends, will restart
        
        
        player.play()
         */
        
    }
    func playerDidFinishPlaying(note: NSNotification){
        print("Video Finished")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        loadVideo()
        
        return
    
        let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "", ofType: "wav")!)
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
            audioPlayer!.delegate = self
            
            
            //playAudioRepeatedly = true
            //playAudio()
            
            // check if audioPlayer is prepared to play audio
            if (audioPlayer!.prepareToPlay())
            {
                audioPlayer!.play()
            }
        }
        catch
        { }
    }
    
    //    MARK: - AVAudioPlayerDelegate Methods
    
    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        
        audioPlayer!.play()
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
