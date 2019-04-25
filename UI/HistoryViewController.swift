//
//  HistoryViewController.swift
//  UI
//
//  Created by Brock Gibson on 4/25/19.
//  Copyright © 2019 Josiah Callaway. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bills: [Bill] = []

    @IBOutlet weak var BillHistoryTableView: UITableView!
    @IBOutlet weak var BillAmount: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BillHistoryTableView.delegate = self
        BillHistoryTableView.dataSource = self
        
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        
    }
    
    func fetchBills() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Bill> = Bill.fetchRequest()
        
        do {
            bills = try managedContext.fetch(fetchRequest)
        }
        catch {
            print("Fetch of bills failed")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchBills()
        BillHistoryTableView.reloadData()
    }
    
    @IBAction func SaveBill(_ sender: Any) {
        
        guard let billAmount = Double(BillAmount.text!) else {
            return
        }
        let date = datePicker.date
        
        let bill = Bill(date: date, amount: billAmount)
        
        if let bill = bill {
            do {
                let managedContext = bill.managedObjectContext
                try managedContext?.save()
                
                fetchBills()
                BillHistoryTableView.reloadData()
                print("Bill Saved")
            } catch {
                alertNotifyUser(message: "Bill not saved.\nAn error occured saving context.")
            }
        } else {
            alertNotifyUser(message: "Bill not saved.\nA Bill entity could not be created.")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BillHistoryTableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        
        let bill = bills[indexPath.row]
        
        cell.textLabel?.text = "$\(bill.amount)"
        cell.detailTextLabel?.text = dateFormatter.string(from: bill.date ?? Date())
        
        return cell
    }
    
    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

}
