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

    @IBOutlet weak var averageBillLabel: UILabel!
    @IBOutlet weak var BillHistoryTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BillHistoryTableView.delegate = self
        BillHistoryTableView.dataSource = self
        
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        
        averageBillLabel.text = "$\(getAverageOfBills())"

        
    }
    
    func deleteBill(at indexPath: IndexPath) {
        let bill = bills[indexPath.row]
        
        if let managedObjectContext = bill.managedObjectContext {
            managedObjectContext.delete(bill)
            
            do {
                try managedObjectContext.save()
                self.bills.remove(at: indexPath.row)
                BillHistoryTableView.deleteRows(at: [indexPath], with: .automatic)
                averageBillLabel.text = "$\(getAverageOfBills())"

            } catch {
                alertNotifyUser(message: "Delete failed.")
                BillHistoryTableView.reloadData()
            }
        }
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
        averageBillLabel.text = "$\(getAverageOfBills())"
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
            action, index in
            self.deleteBill(at: indexPath)
        }
        
        return [delete]
    }
    
    func getAverageOfBills() -> String {
        var average = 0.0
        let total = Double(bills.count)
        
        for bill in bills {
            average += bill.amount
        }
        if bills.count == 0 {
            return "0.0"
        }
            return String(format: "%.2f", average / total)
    }

}
