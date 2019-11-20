//
//  SnapWordListsViewController.swift
//  Kindergarten Snap Words
//
//  Created by Kristen Munro and Ron Gunczler on 11/19/19.
//  Copyright © 2019 Connor Munro and Ron Gunczler. All rights reserved.
//
//Blurb: This app was developed by a kindergartener and his parents, for kindergarteners everywhere to help learn snap words on the go!
//Credits:Designed by: The Kahook Family
/*Programmers: Ron Gunczler & Connor Munro
Project mgmt: Joshua Steinberg MD
Feedback: nida.kahook@gmail.com
Version: 1.0
Copyright: March 30th, 2019 */

import UIKit
import Foundation

func UIColorFromRGB(_ rgb: UInt32) -> UIColor
{
    var redValue: UInt32 = rgb & 0xFF0000
    redValue = redValue >> 16
    redValue /= 255
    var greenValue: UInt32 = rgb & 0x00FF00
    greenValue = greenValue >> 8
    greenValue = greenValue/255
    var blueValue: UInt32 = rgb & 0x0000FF
    blueValue = blueValue/255
    return UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1.0)
}

let violet: UIColor = UIColorFromRGB(0xEE82EE)

let cyan: UIColor = UIColorFromRGB(0x99CCFF)

class AboutViewController: UIViewController
{
    
    let table: UITableView =
    {
        let tv = UITableView()
        tv.backgroundColor = violet
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func loadView()
    {
        super.loadView()
        
        setupTableView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() -> Void
    {
        table.delegate = self as? UITableViewDelegate
        table.dataSource = self as? UITableViewDataSource
        table.register(AboutTableViewCell.self, forCellReuseIdentifier: "cellId")
        
        self.view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            table.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            table.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // 2
        let cell = table.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AboutTableViewCell
        cell.backgroundColor = violet
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
