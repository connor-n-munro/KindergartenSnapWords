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

    override func loadView()
    {
        super.loadView()
         
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let context = appDelegate.persistentContainer.viewContext
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

