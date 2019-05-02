//
//  NewBillViewController.swift
//  UI
//
//  Created by Brock Gibson on 4/30/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit
import CoreData

class NewBillViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var billDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billTextField.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)

    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        if let amountString = billTextField.text?.currencyInputFormatting() {
            billTextField.text = "\(amountString)"
        }
    }
    
    @IBAction func saveBill(_ sender: Any) {
        
        let trimmedText = billTextField.text?.trimmingCharacters(in: CharacterSet.init(charactersIn: "$"))
        
        guard let billAmount = Double(trimmedText!) else {
            alertNotifyUser(message: "Bill not saved.\nComplete All Required Fields")
            return
        }
        
        let date = billDatePicker.date
        let bill = Bill(date: date, amount: billAmount)
        
        if let bill = bill {
            do {
                let managedContext = bill.managedObjectContext
                try managedContext?.save()
                self.navigationController?.popViewController(animated: true)

                print("Bill Saved")
            } catch {
                alertNotifyUser(message: "Bill not saved.\nAn error occured saving context.")
            }
        } else {
            alertNotifyUser(message: "Bill not saved.\nA Bill entity could not be created.")
        }
    }
    
    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

//https://scripttes.blogspot.com/2018/07/text-field-input-uitextfield-use.html

extension String {
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
}
