//
//  MainViewController.swift
//  Kindergarten Snap Words
//
//  Created by Connor Munro & Ron Gunczler on 11/22/19.
//  Copyright © 2019 Connor Munro & Ron Gunczler. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    let titleLabel: UILabel =
    {
        let label =  UILabel()
        label.text = "Kindergarten Snap Words!"
        label.textColor = UIColor.purple
        label.font = UIFont(name: "MarkerFelt-Thin", size: 50)
        return label
    }()
    
    let background: UIImageView =
    {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return imageView
    }()
    
    let nextButton: UIButton =
    {
        let button = UIButton()
        button.titleLabel?.text = "Next →"
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Bold",size: 20)
        button.tintColor = UIColor.blue
        button.addTarget(self, action: #selector(MainViewController.toNextPage), for: .touchUpInside)
        return button
    }()
    
    let aboutButton: UIButton =
    {
        let button = UIButton()
        button.titleLabel?.text = "About?"
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Bold",size: 20)
        button.tintColor = UIColor.blue
        button.addTarget(self, action: #selector(MainViewController.toAboutPage), for: .touchUpInside)
        return button
    }()

    override func loadView()
    {
        super.loadView()
        // Do any additional setup after loading the view.
        view.addSubview(background)
        //Stackview Init
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //Finalization
        stackView.addArrangedSubview(nextButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(aboutButton)
        
        view.addSubview(stackView)
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func toAboutPage(_ sender: Any?) -> Void
    {
        performSegue(withIdentifier: "aboutView", sender: self)
    }
    
    @IBAction func toNextPage(_ sender: Any?) -> Void
    {
        performSegue(withIdentifier: "navigationController", sender: self)
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
