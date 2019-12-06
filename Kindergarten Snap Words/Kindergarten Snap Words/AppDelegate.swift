//
//  AppDelegate.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro & Ron Gunczler on 11/4/19.
//  Copyright © 2019 Connor Munro & Ron Gunczler. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let list1 = ["to", "the", "and", "he", "a", "I", "you", "of", "it", "in"]
    let list2 = ["was", "said", "his", "that", "she", "for", "on", "they", "but", "had"]
    let list3 = ["at", "him", "with", "up", "all", "look", "is", "her", "there", "some"]
    let list4 = ["out", "as", "be", "have", "go", "we", "am", "then", "little", "down"]
    let list5 = ["do", "can", "could", "when", "did", "what", "so", "see", "not", "were"]
    let list6 = ["get", "them", "like", "one", "this", "my", "would", "me", "will", "yes"]
    let list7 = ["big", "went", "are", "come", "if", "now", "first", "no", "came", "ask"]
    let list8 = ["very", "an", "over", "your", "black", "ride", "into", "just", "blue", "red"]
    let list9 = ["from", "good", "any", "about", "around", "want", "won’t", "how", "know", "has"]
    let list10 = ["put", "every", "too", "pretty", "got", "jump", "take", "green", "where", "for"]
    let list11 = ["away", "saw", "find", "white", "by", "after", "us", "well", "here", "why"]
    let list12 = ["ran", "under", "let", "brown", "help", "yellow", "make", "five", "going", "because"]
    let list13 = ["walk", "again", "two", "play", "or", "who", "before", "been", "eat", "may"]
    let list14 = ["stop", "cold", "off", "goes", "three", "six", "seven", "nine", "eight", "ten"]
    let list15 = ["tell", "long", "much", "try", "keep", "new", "give", "must", "work", "start"]
    
   //MARK: - Core Data stack
    
    /*lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Core_Data")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges
        {
            do
            {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    } */

    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

