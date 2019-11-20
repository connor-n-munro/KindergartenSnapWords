//
//  List.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro & Ron Gunczler on 11/11/19.
//  Copyright © 2019 Connor Munro & Ron Gunczler. All rights reserved.
//

import Foundation
import AVFoundation

class List
{
    var name : String
    var words : Array<SnapWord>!
    
    init(newName : String, newWords : Array<SnapWord>)
    {
        self.name = newName
        self.words = newWords
    }
    init(newName : String)
    {
        self.name = newName
        self.words = Array()
    }
    
    func getWords() -> [SnapWord]
    {
        return self.words
    }
    
    func getNumWords() -> Int
    {
        return words.count
    }
    func addWord(_ word: String) -> Void
    {
        words.append(SnapWord(word))
    }
}
