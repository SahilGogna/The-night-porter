//
//  ViewController.swift
//  The Night Porter
//
//  Created by Sahil Gogna on 2019-02-10.
//  Copyright © 2019 Sahil Gogna. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    //UITableViewDataSource is a protocol and first 2 methods are compulsory methods and these methods are called by default
    
    // donot forget to set a data source to the table, we don't populate the data from controller to the table, rather we just tell the table where to find the data source for the data
    
    // go to storyboard, change style from plain to grouped!
    
    //UITableViewDelegate is protocol for table functionalitites
    
    // These are table view data source methods
    
    //returns number of sections in the table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTaks.count
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
        
        // data will be decided according to the section of the table
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTaks[indexPath.row]
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
        default:
            cell.textLabel?.text = "This is not good!"
        }
        
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
    
    let dailyTaks = ["Check all windows", "Check all doors","Is boiler fueled?",
        "Check the mailbox","Empty trash container", "If freezing, check water pipes", "Document Strange and unusual occurances"]
    
    let weeklyTasks = ["Check inside all cabins", "Flush all lavotaries in cabin ", "Walk parameters of property"]
    
    let monthlyTasks = ["Test security alarm", "Test motion detectors", "Test smoke alarms"]
    
    
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

}
