//
//  SnapWord.swift
//  Kindergarten Snap Words
//
//  Created by Kristen Munro on 11/18/19.
//  Copyright © 2019 Connor Munro. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class SnapWord
{
    var word = String()
    var recordingSession = AVAudioSession()
    var wordRecorder = AVAudioRecorder()
    var player = AVAudioPlayer()
    var delegate : AVAudioPlayerDelegate!
    
    
    init(word : String, session: AVAudioSession, recorder: AVAudioRecorder)
    {
        self.word = word
        self.recordingSession = session
        self.wordRecorder = recorder
    }
    init(_ word: String)
    {
        self.word = word
    }
    
    func getWord() -> String
    {
        return self.word
    }
    
    @objc func playAudioButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == "Hear Word"
        { //Play
            //let url = URL(string: urlstring!)
            //downloadFileFromURL(url: url)
        } else {//stop
            sender.setTitle("Stop", for: .normal) // set play image
            player.stop()
        }
    }
    
    func downloadFileFromURL(url: URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url) { (url, response, error) in
            self.play(url: url!)
        }
        downloadTask.resume()
    }
    
    func play(url:URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url as URL)
            player.prepareToPlay()
            player.volume = 2.0
            player.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
}
