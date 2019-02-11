//
//  ViewController.swift
//  The Night Porter
//
//  Created by Sahil Gogna on 2019-02-10.
//  Copyright © 2019 Sahil Gogna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func changeBackground(_ sender: Any) {
        view.backgroundColor = UIColor.darkGray
        
        //getting everything in top level view
        let elemnts = view.subviews
        for element in elemnts {
            
            // is it a label
            if element is UILabel{
                
                // downcast as UI LABEL
                let label = element as! UILabel
                label.textColor = UIColor.lightGray
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
