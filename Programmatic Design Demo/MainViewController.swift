//
//  MainViewController.swift
//  Programmatic Design Demo
//
//  Created by Paige Plander on 3/30/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

/// The first view presented. My insane number of comments
/// makes it look more complicated than it actually is (but hopefully
/// they'll be helpful!)
class MainViewController: UIViewController {
    
    /// struct holding the Constants I use for this view (not necessary)
    struct Constants {
        static let buttonHeight: CGFloat = 100
        static let buttonMargin: CGFloat = 128
        static let buttonCornerRadius: CGFloat = 10
        static let buttonTextSize: CGFloat = 24
        static let buttonColor = UIColor.white
        static let viewColor = UIColor.red
        static let textColor = UIColor.red
    }
    
    // Initialization of `button`
    // This is one of many ways to customize your UI elements.
    // I could have put all of this code into viewDidload, but I
    // find putting it into a closure easier to read and more organized.
    // The closure is of the form (() -> UIButton)
    var button: UIButton = {
        // first create a button to be returned by the closure
        let myButton = UIButton()
        
        // configure the text of the button
        myButton.setTitle("Click me to go to the second view!", for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Avenir", size: Constants.buttonTextSize)
        myButton.titleLabel?.numberOfLines = 2
        myButton.titleLabel?.textAlignment = .center
        myButton.setTitleColor(Constants.textColor, for: .normal)
        
        // configure button itself
        myButton.backgroundColor = Constants.buttonColor
        // makes the corners of the cell rounded, instead of squared off
        myButton.layer.cornerRadius = Constants.buttonCornerRadius
        myButton.layer.masksToBounds = true
       
        // Since we specified that the button is equal
        // to the closure's return value (`button = { ... }())
        // `button` will now equal `myButton`
        return myButton
    }()
    
    // Alternative way to initialize my button. If I did it this way,
    // I would have to set it's background color / title / etc. in viewDidLoad
    /*
     
    var button = UIButton()
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.viewColor
        
        // Calculate the width of the button based off the size of the view
        let buttonWidth: CGFloat = view.frame.width - Constants.buttonMargin
    
        // Create the frame for the button (necessary if not using constraints)
        // I set the x and y values to 0 since I use button.center, so they do not matter
        // I could use x and y to position my view, but this is extra math
        button.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: Constants.buttonHeight)
        
        // This puts my button at the center x and y of the superview (view)
        button.center = view.center
        
        // This is how you link buttons to methods programmatically (if we
        // were using a storyboard we would control drag to our IBAction instead)
        // `addTarget` takes in 3 parameters
        //     1. target: this is where the action method is defined (in our case,
        //          this is our MainViewController, or self)
        //     2. action: the method we want to be called when the button (or other
        //          UI element) is interacted with
        //     3. for: (controlEvents) here we tell Xcode when we want the action 
        //          to be called. In this case, I put ".touchDown" since I want 
        //          "goToNextView" to be called every time the user touches down on the button
        button.addTarget(self, action: #selector(goToNextView), for: .touchDown)
        
        // IMPORTANT: this adds our button to the view. If you do not call this,
        // the button will never show up on the screen
        view.addSubview(button)
    }
    
    /// The method called every time the user taps the button
    /// It will present the secondviewcontroller (equivalent to 
    /// segues in StoryboarD)
    ///
    /// - Parameter sender: the button that was pressed (`button`)
    @IBAction func goToNextView(sender: UIButton) {
        let secondView = SecondViewController()
        // presents the viewController specified, and calls whatever is passed
        // in for `completion` once the view is presented. Since I don't have  
        // any use for a completion handler, I just put a print statement inside
        // for fun (I could've left it nil as well)
        self.present(secondView, animated: true, completion: {
            print("This is called after the Second View Controller is presented!")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
     
    }
}
