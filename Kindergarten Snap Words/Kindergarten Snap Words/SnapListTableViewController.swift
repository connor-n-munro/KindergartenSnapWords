//
//  SnapListTableViewController.swift
//  Kindergarten Snap Words
//
//  Created by Mobile Apps on 12/18/19.
//  Copyright © 2019 Connor Munro. All rights reserved.
//

import UIKit

class SnapListTableViewController: UITableViewController {
    
    //MARK:Properties
    
    var wordLists = [SnapWordList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load Sample Data
        let list1 = SnapWordList("List 1", words: ["to", "the", "and", "he", "a", "I", "you", "of", "it", "in"])
        let list2 = SnapWordList("List 2", words: ["was", "said", "his", "that", "she", "for", "on", "they", "but", "had"])
        let list3 = SnapWordList("List 3", words: ["at", "him", "with", "up", "all", "look", "is", "her", "there", "some"])
  //      let list4 = SnapWordList("List 4", words: ["out", "as", "be", "have", "go", "we", "am", "then", "little", "down"])
  //      let list5 = SnapWordList("List 5", words: ["do", "can", "could", "when", "did", "what", "so", "see", "not", "were"])
  //      let list6 = SnapWordList("List 6", words: ["get", "them", "like", "one", "this", "my", "would", "me", "will", "yes"])
  //      let list7 = SnapWordList("List 7", words: ["big", "went", "are", "come", "if", "now", "first", "no", "came", "ask"])
  //      let list8 = SnapWordList("List 8", words: ["very", "an", "over", "your", "black", "ride", "into", "just", "blue", "red"])
  //      let list9 = SnapWordList("List 9", words: ["from", "good", "any", "about", "around", "want", "won’t", "how", "know", "has"])
 //       let list10 = SnapWordList("List 10", words: ["put", "every", "too", "pretty", "got", "jump", "take", "green", "where", "for"])
 //       let list11 = SnapWordList("List 11", words: ["away", "saw", "find", "white", "by", "after", "us", "well", "here", "why"])
//        let list12 = SnapWordList("List 12", words: ["ran", "under", "let", "brown", "help", "yellow", "make", "five", "going", "because"])
//        let list13 = SnapWordList("List 13", words: ["walk", "again", "two", "play", "or", "who", "before", "been", "eat", "may"])
//        let list14 = SnapWordList("List 14", words: ["stop", "cold", "off", "goes", "three", "six", "seven", "nine", "eight", "ten"])
//        let list15 = SnapWordList("List 15", words: ["tell", "long", "much", "try", "keep", "new", "give", "must", "work", "start"])
        wordLists.append(list1)
        wordLists.append(list2)
        wordLists.append(list3)
//        wordLists.append(list4)
 //       wordLists.append(list5)
//        wordLists.append(list6)
//        wordLists.append(list7)
//        wordLists.append(list8)
//        wordLists.append(list9)
//        wordLists.append(list10)
//        wordLists.append(list11)
//        wordLists.append(list12)
//        wordLists.append(list13)
//        wordLists.append(list14)
//        wordLists.append(list15)
        print(wordLists[2].words[5].word)
        print(list3.title)
        //loadSampleLists()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "SnapListTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SnapListTableViewCell  else {
            fatalError("The cell is not an instance of SnapListTableViewCell.")
        }

        // Code referenced from Apple's development tutorial
        
        let listInUse = wordLists[indexPath.row]
        
        cell.nameLabel.text = listInUse.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SnapWordViewController
        {
            let vc = segue.destination as? SnapWordViewController
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                vc?.list = wordLists[indexPath.row]
                //print()
                print(indexPath.row)
                for i in 0...9{
                    print(wordLists[indexPath.row].words[i].word)
                    //print(vc?.list.words[i].word)
                }
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleLists()
    {
        let snapWord1 = SnapWord(newWord: "and", ifSound: false)
        let snapWord2 = SnapWord(newWord: "the", ifSound: false)
        let snapWord3 = SnapWord(newWord: "cat", ifSound: false)
        let listOfWords : [SnapWord] = [snapWord1, snapWord2, snapWord3]
        
        guard let list1 = SnapWordList("sample title", listOfWords: listOfWords)
            else {
                fatalError("Unable to instantiate list1")
        }
        guard let list2 = SnapWordList("second title", listOfWords: listOfWords)
            else {
                fatalError("Unable to instantiate list2")
        }
        
        wordLists += [list1, list2]
        
    }

}
