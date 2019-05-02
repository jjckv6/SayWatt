//
//  ViewController.swift
//  UI
//
//  Created by Josiah Callaway on 4/22/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var settingsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradient(colorOne: Colors.green, colorTwo: Colors.darkGreen)
        
        settingsButton.layer.cornerRadius = 4
        settingsButton.setGradient(colorOne: Colors.green, colorTwo: Colors.darkGreen)
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }


}

