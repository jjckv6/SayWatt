//
//  HomeViewController.swift
//  UI
//
//  Created by Josiah Callaway on 5/2/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.setGradient(colorOne: Colors.green, colorTwo: Colors.darkGreen)
        
        settingsButton.layer.cornerRadius = 4
        settingsButton.setGradient(colorOne: Colors.green, colorTwo: Colors.darkGreen)
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
