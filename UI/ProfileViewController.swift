//
//  ProfileViewController.swift
//  UI
//
//  Created by Brady Burress on 5/2/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit
import CoreData


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var userImage: UIButton!
    @IBOutlet weak var nameButton: UIButton!
    var score : Int = 0
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        score = getScore()
        scoreLabel.text = "\(score)"
    }
    
    @IBAction func shareScore(_ sender: UIButton) {
        let scoreText = "My SayWatt score was \(score)! Can you do better?"
        
        let scoreImage = UIImage(named: "sayWattLogo.jpg")
    
        //let items = [scoreText, scoreImage] as [Any] //include app store link and logo?
        
        let activityViewController = UIActivityViewController(activityItems: [scoreText, scoreImage as Any], applicationActivities: nil)

        
        present(activityViewController, animated: true)
    }

    
    @IBAction func changeImage(_ sender: Any) {
        
        
        
    }
    
    @IBAction func changeName(_ sender: Any) {
        
    }
    
    func getScore() -> Int {
        let avgBill = 83.50 //get from history for real build
        
        //average bill in the US = 107, to make the average be a score of 50 we multiply by 50 = 5350
        let scoreConstant = 5350.0
        
        return Int(floor(scoreConstant/avgBill))
    }
    
    
    
    
    
}
