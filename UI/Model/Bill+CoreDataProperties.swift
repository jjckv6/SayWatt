//
//  Bill+CoreDataProperties.swift
//  UI
//
//  Created by Brock Gibson on 4/25/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//
//

import Foundation
import CoreData


extension Bill {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bill> {
        return NSFetchRequest<Bill>(entityName: "Bill")
    }

    @NSManaged public var rawDate: NSDate?
    @NSManaged public var amount: Double

}
