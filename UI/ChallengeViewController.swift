//
//  ChallengeViewController.swift
//  UI
//
//  Created by knstz4 on 5/8/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var challengetableView: UITableView!
    
    
        let challenges = [
            "SPROUT",
            "Turn off the water when brushing your teeth.",
            "Take a 3-minute shower today.",
            "Invite your friends to walk with you to lunch or dinner.",
            "Air dry your hair.",
            "Read by candlelight tonight. (Dont catch your book on fire)",
            "Use natural light from 8am - 5pm",
            "Air dry dishes instead of drying in the dishwasher.",
            "Don't watch TV today.",
            "If it's a nice day, spend your day outside!",
            "",
            "SAPLING",
            "Have no leaky faucets in your house",
            "Use rainwater to water your plants",
            "Carpool or take publio transportation for the entire day.",
            "Add attic insulation:",
            "Change bulbs to LED bulbs.",
            "Clean or replace all the filters in your home if you havent recently.",
            "Cut down drying time with dryer balls.",
            "Check the insulation in your attic if you have one.",
            "Choose cloth over paper.",
            "",
            "ECO-EXTREMIST",
            "Replace your toilet with a water efiicient one.",
            "Install a high-efficiency showerhead.",
            "Use an electric car.",
            "Install a programmable thermostat.",
            "Weatherstrip spaces around doors and windows.",
            "Get a home ENERGY STAR assesment. (Free in Columbia!)"
            ]
            

            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "challenge")
        cell.textLabel?.text = challenges[indexPath.row]
        
        return(cell)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        challengetableView.delegate = self
        challengetableView.dataSource = self
    }
    

   

}
