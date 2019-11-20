//
//  SnapWordViewController.swift
//  Kindergarten Snap Words
//
//  Created by Kristen Munro on 11/16/19.
//  Copyright © 2019 Connor Munro. All rights reserved.
//

import UIKit

class SnapWordViewController: UIViewController
{
    
    let bundle = Bundle.main
    
    var specWord : Int = 0
    var list : List
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView()
    {
        super.loadView()
        
        let nextWordButton = UIButton()
        let prevWordButton = UIButton()
        
        nextWordButton.setTitle("Next Word →", for: .normal)
      //  nextWordButton.setTitleColor(.systemBlue, for: .normal)
        nextWordButton.addTarget(self, action: #selector(nextWord), for: .touchUpInside)
        nextWordButton.translatesAutoresizingMaskIntoConstraints = false
        
        prevWordButton.setTitle("← Previous Word", for: .normal)
      //  prevWordButton.setTitleColor(.systemBlue, for: .normal)
        prevWordButton.addTarget(self, action: #selector(prevWord), for: .touchUpInside)
        prevWordButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(nextWordButton)
        self.view.addSubview(prevWordButton)
    }
    
    @objc func nextWord()  -> Void
    {
        if(specWord < list.getWords().count)
        {
            specWord += 1
        } else {
            
        }
    }
    
    @objc func prevWord() -> Void
    {
        if(specWord > 0)
        {
            specWord -= 1
        } else {
            
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
