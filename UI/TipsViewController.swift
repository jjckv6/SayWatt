//
//  ViewController.swift
//  UI
//
//  Created by Josiah Callaway on 4/22/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tipsTableView: UITableView!
    
    let tips = [
        "WATER",
        "Only do full loads when washing your dishes.",
        "Use the energy saver mode on your dishwasher.",
        "Take shorter showers.",
        "Consolidate loads of laundry.",
        "Reduce the temperature setting on your water heater to 120 degrees or less.",
        "Wash clothes in cool or cold water whenever possible.",
        "",
        
        "GAS",
        "Ride a bike to the store or work today.",
        "Adjust your thermostat throughout the day.",
        "",
        
        "ENERGY",
        "Don’t charge your appliances unnecessarily throughout the day.",
        "Save electricity by plugging appliances into a power strip and turning them off completely when not in use, including your computer.",
        "Turn off the lights. Your TV or computer screen provides a cozy glow, so turn off other lights if you don’t need them.",
        "Unplug unused appliances.",
        "Change your furnace filter every 1-2 months.",
        "Set thermostat settings as high as possible while maintaining reasonable comfort levels while you’re home and 84 degrees when you’re away. (AIR CONDITIONING)",
        "Set thermostat settings at 68 degrees while you’re home and 60 degrees when you’re away. (HEATING)",
        "Use blinds and curtains strategically: they can help heat or cool your room and can be sources of light.",
        "Clean your refrigerator coils in the spring.",
        "Set the temperature for your refrigerator to 37 to 40 F degrees and 5 F degrees for the freezer.",
        "",
        
        "SUSTAIN",
        "Buy a reusable water bottle.",
        "Reuse plastic water bottles.",
        "Purchase local products when possible."
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "tip")
        cell.textLabel?.text = tips[indexPath.row]
        
        return(cell)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

