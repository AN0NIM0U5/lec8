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
        
        // add target to the button (so it will call `goToMain` when pressed)
        secondButton.addTarget(self, action: #selector(goToMain), for: .touchDown)
    
        // IMPORTANT: this adds our button to the view.
        view.addSubview(secondButton)
        
        // set up the constraints for the button
        setupConstraints()
        
    }
    
    // Creates layout constraints for the button (notice how we never
    // create a frame for the button, like we did in the MainViewController
    func setupConstraints() {
        let btn = secondButton
        // Tell Xcode not to create its own constraints
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        // center the button horizontally in the view
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // center the button vertically in the view
        secondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // add a margin of `buttonMargin` (defined at top of file in struct) between view and left of the button
        secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.buttonMargin).isActive = true
        // add a margin of `buttonMargin` to right of button.
        // this should be negative since we want it to the right of
        // the view's margin
        secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.buttonMargin).isActive = true
        // constrains the button's height to a set size
        secondButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }

    /// Presents the main view controller
    ///
    /// - Parameter sender: the button that was pressed (`button`)
    @IBAction func goToMain(sender: UIButton) {
        let mainView = MainViewController()
        self.present(mainView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
