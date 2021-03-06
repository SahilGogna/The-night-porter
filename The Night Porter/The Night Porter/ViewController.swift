//
//  ViewController.swift
//  The Night Porter
//
//  Created by Sahil Gogna on 2019-02-10.
//  Copyright © 2019 Sahil Gogna. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    
    @IBOutlet weak var taskTable: UITableView!
    
    //UITableViewDataSource is a protocol and first 2 methods are compulsory methods and these methods are called by default
    
    // donot forget to set a data source to the table, we don't populate the data from controller to the table, rather we just tell the table where to find the data source for the data
    
    // go to storyboard, change style from plain to grouped!
    
    //UITableViewDelegate is protocol for table functionalitites
    
    // These are table view data source methods
    
    //returns number of sections in the table
    func numberOfSections(in tableView: UITableView) -> Int {
        // when we set color to dark in the table view it was overlapping due to the white color of the sections
        tableView.backgroundColor = UIColor.clear // clear so that they become transparent
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // IndexPath is a structure, read doc
        
        let cell = UITableViewCell()
        
        //the current task type instance
        var currentTask : Task!
        
        // data will be decided according to the section of the table
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        
        //use the name property to set the value of the cell
        cell.textLabel?.text = currentTask?.name
        
        if currentTask!.completed{
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = UIColor.lightGray
        }else{
            cell.accessoryType = .none
            cell.textLabel?.textColor = UIColor.black
        }
        
        //set the cell background
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    var dailyTasks = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Is boiler fueled?", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash container", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Document Strange and unusual occurances", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Check inside all cabins", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Flush all lavotaries in cabin ", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Walk parameters of property", type: .weekly, completed: false, lastCompleted: nil)
    ]
    
    var monthlyTasks = [
        Task(name: "Test security alarm", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "Test motion detectors", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .monthly, completed: false, lastCompleted: nil)
    ]
    
    // earlier I was using string array, but now this string array has been replaced by Task array
    
//    let dailyTaks = ["Check all windows", "Check all doors","Is boiler fueled?",
//        "Check the mailbox","Empty trash container", "If freezing, check water pipes", "Document Strange and unusual occurances"]
//
//    let weeklyTasks = ["Check inside all cabins", "Flush all lavotaries in cabin ", "Walk parameters of property"]
//
//    let monthlyTasks = ["Test security alarm", "Test motion detectors", "Test smoke alarms"]
    
    
    // these are the table view delegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You have selected row \(indexPath.row) in the section \(indexPath.section)")
    }

/*
     This code was earlier used when we had different labels for each task and we
     changed the background of the screen and also got all the labels and
     changed their colours.
*/
//    @IBAction func changeBackground(_ sender: Any) {
//        view.backgroundColor = UIColor.darkGray
//
//        //getting everything in top level view
//        let elemnts = view.subviews
//        for element in elemnts {
//
//            // is it a label
//            if element is UILabel{
//
//                // downcast as UI LABEL
//                let label = element as! UILabel
//                label.textColor = UIColor.lightGray
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn{
            view.backgroundColor = UIColor.darkGray
        } else{
            view.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func resetList(_ sender: UIBarButtonItem) {
        
        let confirm = UIAlertController(title: "Reset List", message: "Are you sure? ", preferredStyle: .alert)
        
        let actionYes = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            for task in 0...self.dailyTasks.count-1{
                self.dailyTasks[task].completed = false
            }
            
            for task in 0...self.weeklyTasks.count-1{
                self.weeklyTasks[task].completed = false
            }
            
            for task in 0...self.monthlyTasks.count-1{
                self.monthlyTasks[task].completed = false
            }
            self.taskTable.reloadData()
        }
        
        let actionNo = UIAlertAction(title: "No", style: .cancel) { (action) in
            print("Cancelled!")
        }
        
        //add actions to the alertcontroller
        confirm.addAction(actionYes)
        confirm.addAction(actionNo)
        
        //show the dialoge box
        present(confirm, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView:UIView, actionPerformed:(Bool) -> Void) in
            // find the right object and set it to completed
            
            switch indexPath.section{
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            tableView.reloadData()
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
}
