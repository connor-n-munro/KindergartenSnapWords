//
//  List.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro & Ron Gunczler on 11/25/19.
//  Copyright © 2019 Connor Munro & Ron Gunczler. All rights reserved.
//

import Foundation
import AVFoundation

let LIST_SIZE = 10

public class SnapWord : NSObject, NSCoding
{
    enum Keys: String
    {
        case word = "word"
        case hasSound = "has_sound"
        case url = "url"
    }
    var word : String?
    var url : URL?
    var hasSound : Bool
    
    init(newWord: String? = nil,
         ifSound: Bool? = false)
    {
        self.word = newWord
        self.hasSound = ifSound!
    }
    public func encode(with aCoder: NSCoder)
    {
        aCoder.encode(word, forKey: Keys.word.rawValue)
        aCoder.encode(hasSound, forKey: Keys.hasSound.rawValue)
    }

    public required convenience init?(coder aDecoder: NSCoder)
    {
        let word = aDecoder.decodeObject(forKey: Keys.word.rawValue) as! String
        let hasSound = aDecoder.decodeObject(forKey: Keys.hasSound.rawValue) as! Bool
        self.init(newWord: word, ifSound: hasSound)
        self.url = Bundle.main.url(forResource: word, withExtension: "m4a", subdirectory: "Kindergarten Snap Words/SnapWordsAudio") ?? nil
    }
}

class SnapWordList : NSObject, NSCoding
{
    
    enum Keys: String
    {
        case title = "title"
        case words = "words"
    }
    
    //var audioPlayer : AVAudioPlayer? <-- add to view 
    var title : String
    var words : [SnapWord]
    
    init(_ title : String, listOfWords: [SnapWord])
    {
        self.title = title
        self.words = [SnapWord](repeating: SnapWord(), count: LIST_SIZE)
        for i in 0...LIST_SIZE {
            self.words[i] = listOfWords[i]
        }
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(title, forKey: Keys.title.rawValue)
        for i in 0...LIST_SIZE
        {
            words[i].encode(with: aCoder)
        }
        aCoder.encode(words, forKey: Keys.words.rawValue)
    }

    required convenience init?(coder aDecoder: NSCoder)
    {
        let title = aDecoder.decodeObject(forKey: Keys.title.rawValue) as! String
        //let words = aDecoder.decodeFloat(forKey: Keys.words.rawValue)
        var newWords = [SnapWord](repeating: SnapWord(), count: LIST_SIZE)
        for i in 0...LIST_SIZE
        {
            newWords[i] = SnapWord.init(coder: aDecoder) ?? SnapWord.init(newWord: "", ifSound: false)
        }
        self.init(title, listOfWords: newWords)
    }
    
    init(_ title : String)
    {
        self.title = title
        self.words = [SnapWord](repeating: SnapWord(), count: LIST_SIZE)
    }
    func matchSoundToWords() -> Void
    {
        //match word to URL of soundbyte, all lowercase with m4a file extension
    }
    
    func changeTitle(_ newTitle : String) -> Void
    {
        self.title = newTitle
    }
    func addWord(_ newWord : String) -> Int
    {
        var i = 0
        while(i < LIST_SIZE)
        {
            if(self.words[i].word == nil)
            {
                self.words[i].word = newWord
                
                return i
            }
            i += 1
        }
        return -1
    }
    func addSound(forWord: String)
    {
        
    }
    
}