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
        loadSampleLists()

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
        
        //print(list1.getTitle())
        //print(list1.getWord(2))
    }

}
