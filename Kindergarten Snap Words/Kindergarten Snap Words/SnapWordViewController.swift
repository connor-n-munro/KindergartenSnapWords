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
    var specWord : Int = 0
    var list : SnapWordList
    //MARK: - Init
    init(_ title : String)
    {
        
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Word
    let word : UILabel =
    {
        let label = UILabel()
        label.font = UIFont(name: "MarkerFelt-Thin", size: 50)
        label.numberOfLines = 0
        return label
    }()
    
    override func loadView()
    {
        super.loadView()
        
        let nextWordButton = UIButton()
        let prevWordButton = UIButton()
        //MARK: - NextButton
        nextWordButton.setTitle("Next Word →", for: .normal)
        nextWordButton.addTarget(self, action: #selector(nextWord), for: .touchUpInside)
        nextWordButton.translatesAutoresizingMaskIntoConstraints = false
        //MARK: - PrevButton
        prevWordButton.setTitle("← Previous Word", for: .normal)
        prevWordButton.addTarget(self, action: #selector(prevWord), for: .touchUpInside)
        prevWordButton.translatesAutoresizingMaskIntoConstraints = false
        //MARK: - StackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(nextWordButton)
        stackView.addArrangedSubview(prevWordButton)
        //MARK: - Finalization
        self.view.addSubview(stackView)
    }
    
    @objc func nextWord()  -> Void
    {
        if(specWord < LIST_SIZE)
        {
            specWord += 1
            if(list.wordExists(specWord))
            {
                word.text = list.getWord(specWord)
                //change AVAudioPlayer
            }
        } else {
            //shake animation
        }
    }
    
    @objc func prevWord() -> Void
    {
        if(specWord > 0)
        {
            specWord -= 1
            if(list.wordExists(specWord))
            {
                word.text = list.getWord(specWord)
            }
        } else {
            //shake animation
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
