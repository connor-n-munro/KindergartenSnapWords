//
//  SnapWordViewController.swift
//  Kindergarten Snap Words
//
//  Created by Kristen Munro on 11/16/19.
//  Copyright © 2019 Connor Munro. All rights reserved.
//

import UIKit
import AVFoundation

class SnapWordViewController: UIViewController
{
    var specWord : Int = 0
    var list : SnapWordList
    var audioPlayer = AVAudioPlayer()
    //MARK: - Init
    required init?(coder: NSCoder)
    {
        self.list = SnapWordList("")
        super.init(coder: coder)
    }
    init?(_ title : String)
    {
        self.list = SnapWordList("")
        let newList = SnapWordList(title)
        let coder = NSCoder()
        let documentsURL = try! FileManager.default.url(for: .documentDirectory , in: .localDomainMask, appropriateFor: nil, create: false)
        var listURL = URL(fileReferenceLiteralResourceName: "SnapWordList_" + title.lowercased())
        let docContents =
            try! FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])
        for file in docContents
        {
            if(file.lastPathComponent.hasPrefix("SnapWordsList_") && file.lastPathComponent.hasSuffix(title.lowercased()))
            {
                listURL = file
            }
        }
        let listContents = try! FileManager.default.contentsOfDirectory(at: listURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])
        for file in listContents
        {
            if(file == listURL)
            {
                newList.words = try! JSONDecoder().decode([SnapWord].self, from: Data(contentsOf: file))
            }
        }
        self.list = newList
        super.init(coder: coder)
    }
    //MARK: - Word
    let word : UILabel =
    {
        let label = UILabel()
        label.font = UIFont(name: "MarkerFelt-Thin", size: 50)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor.cyan
        return label
    }()
    //MARK: - homeButton
    let homeButton : UIButton =
    {
        let button = UIButton()
        button.setTitle("Return to Main Screen", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 15)
        button.titleLabel?.textColor = .cyan
        button.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: - nextButton
    let nextWordButton : UIButton =
    {
        let button = UIButton()
        button.setTitle("Next Word →", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 25)
        button.titleLabel?.textColor = .cyan
        button.addTarget(self, action: #selector(nextWord), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: - prevButton
    let prevWordButton : UIButton =
    {
        let button = UIButton()
        button.setTitle("← Previous Word", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 25)
        button.titleLabel?.textColor = .cyan
        button.addTarget(self, action: #selector(prevWord), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: - playButton
    let playButton : UIButton =
    {
        let button = UIButton()
        button.setTitle("▶️", for: .normal)
        button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func loadView()
    {
        super.loadView()
        
        //MARK: - StackViews
        
        /*outerStackView.axis = .vertical
        outerStackView.alignment = .leading
        outerStackView.distribution = .fillProportionally
        outerStackView.spacing = 50
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        innerStackView.axis = .horizontal
        innerStackView.spacing = 75
        innerStackView.alignment = .center
        innerStackView.distribution = .fill
        innerStackView.translatesAutoresizingMaskIntoConstraints = false */
        
        //MARK: - Adding Subviews
        self.view.backgroundColor = .purple
        self.view.addSubview(word)
        self.view.addSubview(homeButton)
        self.view.addSubview(playButton)
        self.view.addSubview(prevWordButton)
        self.view.addSubview(nextWordButton)
        if(list.hasSound(specWord))
        {
            playButton.isEnabled = true
            playButton.alpha = 1.0
        } else {
            playButton.isEnabled = false
            playButton.alpha = 0.5
        }
        //MARK: - Layout Constraints
        NSLayoutConstraint.activate([
            //main label word - centered in the view
            self.word.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.word.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            //home button - top left of screen
            self.homeButton.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            self.homeButton.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            //previous word button - down and to the left of the word in the center of the screen
            self.prevWordButton.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            self.prevWordButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            //next word button - down and to the right of the word in the center of the screen
            self.nextWordButton.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            self.nextWordButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            //play button - centerX, directly in line with other buttons
            self.playButton.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.playButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    //MARK: - Helper Methods
    @objc func nextWord()  -> Void
    {
        print("from ",specWord)
        if(specWord < 9)
        {
            if (specWord <= 0) {specWord = 0}
            specWord += 1
            print("got here (",specWord,") nextWord")
            if(list.wordExists(specWord))
            {
                word.text = list.getWord(specWord)
                print(word.text!)
                if(list.hasSound(specWord))
                {
                    playButton.isEnabled = true
                    playButton.alpha = 1.0
                } else {
                    playButton.isEnabled = false
                    playButton.alpha = 0.5
                }
            }
        } else {
            //shake animation
            //specWord -= 1
            print("aah next ", specWord)
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 3
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: nextWordButton.center.x - 10, y: nextWordButton.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: nextWordButton.center.x + 10, y: nextWordButton.center.y))
            nextWordButton.layer.add(animation, forKey: "position")
        }
        print("all next", specWord)
    }
    
    @objc func prevWord() -> Void
    {
        print("from", specWord)
        if(specWord > 0)
        {
            if (specWord >= 9) {specWord = 9}
            specWord -= 1
            print("got here (",specWord,")prevWord")
            if(list.wordExists(specWord))
            {
                word.text = list.getWord(specWord)
                if(list.hasSound(specWord))
                {
                    playButton.isEnabled = true
                    playButton.alpha = 1.0
                } else {
                    playButton.isEnabled = false
                    playButton.alpha = 0.5
                }
            }
        } else {
            //shake animation
            //specWord += 1
            print("aah prev ", specWord)
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 3
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: prevWordButton.center.x - 10, y: prevWordButton.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: prevWordButton.center.x + 10, y: prevWordButton.center.y))
            prevWordButton.layer.add(animation, forKey: "position")
        }
        print("all prev", specWord)
    }
    
    @objc func goHome() -> Void
    {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func playSound() -> Void
    {
        if(list.hasSound(specWord))
        {
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: list.getURL(specWord))
                audioPlayer.play()
            }
            catch
            {
                fatalError("cannot get sound file")
            }
        }
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad()
    {
        super.viewDidLoad()
        word.text = list.getWord(specWord)
        // Do any additional setup after loading the view.
    }
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
