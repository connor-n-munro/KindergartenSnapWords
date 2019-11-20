//
//  ViewController.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro & Ron Gunczler on 11/4/19.
//  Copyright © 2019 Connor Munro & Ron Gunczler. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    let list1 = ["to", "the", "and", "he", "a", "I", "you", "of", "it", "in"]
    let list2 = ["was", "said", "his", "that", "she", "for", "on", "they", "but", "had"]
    let list3 = ["at", "him", "with", "up", "all", "look", "is", "her", "there", "some"]
    let list4 = ["out", "as", "be", "have", "go", "we", "am", "then", "little", "down"]
    let list5 = ["do", "can", "could", "when", "did", "what", "so", "see", "not", "were"]
    let list6 = ["get", "them", "like", "one", "this", "my", "would", "me", "will", "yes"]
    let list7 = ["big", "went", "are", "come", "if", "now", "first", "no", "came", "ask"]
    let list8 = ["very", "an", "over", "your", "black", "ride", "into", "just", "blue", "red"]
    let list9 = ["from", "good", "any", "about", "around", "want", "won’t", "how", "know", "has"]
    
    override func loadView()
    {
        super.loadView()
        self.view.viewWithTag(3)?.isHidden = true
        
        //MARK: - LISTS
        
         
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //let entity = NSEntityDescription.entity(forEntityName: "Lists", in: context)
        //CAUSES A SEG FAULT ^^^
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   /* @IBAction func switchAbout(_ sender: UIButton)
    {
        switch sender.tag
        {
        case 0: //hit the about button, show the about page
            self.view.viewWithTag(3)?.isHidden = false;
            break
        case 1: //hit the return button on the about page, return to main screen
            self.view.viewWithTag(3)?.isHidden = true;
            break
        default:
            print("something went wrong /(sender.tag)" )
        }
        
    } */
    
    
}

