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

public class SnapWord : Codable
{
    enum CodingKeys: String, CodingKey
    {
        case hasSound = "has_sound"
        case word = "word"
        case url = "url"
    }
    enum Keys: String
    {
        case word = "word"
        case hasSound = "has_sound"
        case url = "url"
    }
    var word : String?
    var url : URL?
    var hasSound : Bool
    
    init()
    {
        self.word = nil
        self.hasSound = false
        
    }
    
    init(newWord: String,
         ifSound: Bool)
    {
        self.word = newWord
        self.hasSound = ifSound
    }
    public func encode(with aCoder: NSCoder)
    {
        aCoder.encode(word, forKey: Keys.word.rawValue)
        aCoder.encode(hasSound, forKey: Keys.hasSound.rawValue)
    }

    public required convenience init?(coder aDecoder: NSCoder)
    {
        let word = aDecoder.decodeObject(forKey: Keys.word.rawValue) as! String? ?? ""
        let hasSound = aDecoder.decodeObject(forKey: Keys.hasSound.rawValue) as! Bool? ?? false
        self.init(newWord: word, ifSound: hasSound)
        self.url = Bundle.main.url(forResource: word, withExtension: "m4a", subdirectory: "SnapWordsAudio") ?? nil
    }
    
    public func ifSound() -> Bool
    {
        if(hasSound)
        {
            return true
        } else {
            return false
        }
    }
}

public class SnapWordList : NSObject, NSCoding
{
    enum Keys: String
    {
        case title = "title"
        case words = "words"
    }
    
    //var audioPlayer : AVAudioPlayer? <-- add to view
    var title : String
    var words : [SnapWord]
    
    init?(_ title : String, listOfWords: [SnapWord])
    {
        self.title = title
        self.words = [SnapWord](repeating: SnapWord(), count: LIST_SIZE)
        for i in 0...(listOfWords.count) {
            self.words[i] = listOfWords[i]
            //print(self.words[i])
        }
    }
    
    public func encode(with aCoder: NSCoder)
    {
        aCoder.encode(title, forKey: Keys.title.rawValue)
        for i in 0...LIST_SIZE
        {
            words[i].encode(with: aCoder)
        }
        aCoder.encode(words, forKey: Keys.words.rawValue)
    }

    required convenience public init?(coder aDecoder: NSCoder)
    {
        let title = aDecoder.decodeObject(forKey: Keys.title.rawValue) as! String
        //let words = aDecoder.decodeFloat(forKey: Keys.words.rawValue)
        var newWords = [SnapWord](repeating: SnapWord(), count: LIST_SIZE)
        for i in 0...LIST_SIZE
        {
            newWords[i] = SnapWord.init(coder: aDecoder) ?? SnapWord()
        }
        self.init(title, listOfWords: newWords)
    }
    
    init(_ title : String)
    {
        self.title = title
        self.words = [SnapWord](repeating: SnapWord(), count: LIST_SIZE)
    }
    init(_ title: String, words: [String])
    {
        print(words)
        self.title = title
        self.words = [SnapWord]()
        super.init()
        var i = 0
        for word in words
        {
            self.words.append(SnapWord(newWord: word, ifSound: true))
            print(word + ": " + words[i])
            i += 1
        }
      //  for a in 0...9{
      //      print("i",a ,self.words[a].word)
       // }
        matchSoundToWords()
        
    }
    func matchSoundToWords() -> Void
    {
        //match word to URL of soundbyte, all lowercase with m4a file extension
        for i in 0...9
        {
            if(words[i].word != nil && words[i].hasSound)
            {
                guard let bundleURL = Bundle.main.url(forResource: "SnapWordsAudio", withExtension: "bundle") else {return}
                guard let bundle = Bundle(url: bundleURL) else {return}
                //let soundPath = bundle.path(forResource: words[i].word, ofType: "m4a")
                //let path = Bundle.main.path(forResource: words[i].word, ofType: "m4a")!
                words[i].url = bundle.url(forResource: words[i].word!.lowercased(), withExtension: "m4a")
            }
        }
    }
    
    func changeTitle(_ newTitle : String) -> Void
    {
        self.title = newTitle
    }
    func addWord(_ newWord : String, _ hasSound : Bool) -> Void
    {
        var i = 0
        while(i < LIST_SIZE)
        {
            if(!wordExists(i))
            {
                self.words[i].word = newWord
                self.words[i].hasSound = hasSound
                return
            }
            i += 1
        }
    }
    func wordExists(_ i : Int) -> Bool //This really needs to change
    {
        if(i > 9 || words[i].word == "" || words[i].word == nil )  {
            return false
        } else {
            return true
        }
    }
    func getWord(_ i : Int) -> String
    {
        if(wordExists(i))
        {
            return words[i].word!
        } else {
            return "Word not found!"
        }
    }
    
    func getTitle() -> String
    {
        return self.title
    }
    public func hasSound(_ i : Int) -> Bool
    {
        if(words[i].ifSound())
        {
            return true
        } else {
            return false
        }
    }
    
    public func getURL(_ i : Int) -> URL
    {
        if(wordExists(i) && hasSound(i)) //has sound is automatically set to true. has sound needs to be set by checking the url path. otherwise we have no idea if it's looking in the right place
        {
            return words[i].url!
        } else {
            return URL(string: "noFileFound")!
        }
    }
}
