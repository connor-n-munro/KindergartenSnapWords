//
//  SnapWordListsViewController.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro and Ron Gunczler on 11/19/19.
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

class AboutViewController: UIViewController
{
    let blurbLabel: UILabel =
   {
        let text = UILabel()
        text.text = "This app was developed by a kindergartener\r and his parents, for kindergarteners everywhere\r to help learn snap words on the go!"
        text.textColor = UIColor.blue
        text.backgroundColor = UIColor.purple
        text.lineBreakMode = .byWordWrapping
        text.textAlignment = .center
        text.numberOfLines = .min
        text.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
   }()
    
    let creditsLabel: UILabel =
    {
        let text = UILabel()
        text.text = "Designed by: The Kahook Family \rProgrammers: Ron Gunczler & Connor Munro \rProject mgmt: Joshua Steinberg MD \rFeedback: nida.kahook@gmail.com \rVersion: 1.0 \rCopyright: March 30th, 2019"
        text.textColor = UIColor.blue
        text.lineBreakMode = .byWordWrapping
        text.numberOfLines = .min
        text.backgroundColor = UIColor.purple
        text.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    
    let returnButton: UIButton =
    {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 25)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(AboutViewController.returnToMainScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.purple
        //Contents
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //Finalization
        stackView.addArrangedSubview(blurbLabel)
        stackView.addArrangedSubview(creditsLabel)
        stackView.addArrangedSubview(returnButton)
        view.addSubview(stackView)
    }

    @IBAction func returnToMainScreen() -> Void
    {
        dismiss(animated: true, completion: nil)
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
