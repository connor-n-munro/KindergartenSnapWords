//
//  List.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro & Ron Gunczler on 11/11/19.
//  Copyright © 2019 Connor Munro & Ron Gunczler. All rights reserved.
//

import Foundation
import AVFoundation

class SnapWord
{
    var word : String
    var recordingSession : AVAudioSession!
    var wordRecorder : AVAudioRecorder!
    
    init(word : String)
    {
        self.word = word
    }
}

class List
{
    var name : String
    var words : Array<SnapWord>
    
    init(newName : String, newWords : Array<SnapWord>)
    {
        self.name = newName
        self.words = newWords
    }
}
