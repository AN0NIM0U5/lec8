//
//  SecondViewController.swift
//  Programmatic Design Demo
//
//  Created by Paige Plander on 3/30/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

/// In this view controller, I will do the same thing as I did in
/// MainViewController.swift but now with programmatic constraints!
class SecondViewController: UIViewController {
    
    /// struct holding the Constants I use for this view (not necessary)
    struct Constants {
        static let buttonHeight: CGFloat = 120
        static let buttonMargin: CGFloat = 64
        static let buttonCornerRadius: CGFloat = 10
        static let buttonTextSize: CGFloat = 24
        static let buttonColor = UIColor.white
        static let viewColor = UIColor.black
        static let textColor = UIColor.black
    }
    
    // See MainViewController.swift for info about this syntax
    var secondButton: UIButton = {
        let newButton = UIButton()
        // configure the text of the button
        newButton.setTitle("Click me to go to the main view controller!", for: .normal)
        newButton.titleLabel?.font = UIFont(name: "Avenir", size: Constants.buttonTextSize)
        newButton.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        newButton.titleLabel?.numberOfLines = 2
        newButton.titleLabel?.textAlignment = .center
        newButton.setTitleColor(Constants.textColor, for: .normal)
        newButton.backgroundColor = Constants.buttonColor
        newButton.layer.cornerRadius = Constants.buttonCornerRadius
        newButton.layer.masksToBounds = true
        return newButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.viewColor
        
        // TODO: add target to the button (so it will call `goToMain` when pressed)
        
        // TODO: add button to the view
        
        // TODO: set up the constraints for the button
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
