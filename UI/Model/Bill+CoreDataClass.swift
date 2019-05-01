//
//  Bill+CoreDataClass.swift
//  UI
//
//  Created by Brock Gibson on 4/25/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Bill)
public class Bill: NSManagedObject {
    
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(date: Date, amount: Double) {
        let appDelegate  = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }

        self.init(entity: Bill.entity(), insertInto: managedContext)
        
        self.date = date
        self.amount = amount
    }
    

}
