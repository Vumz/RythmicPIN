//
//  InterfaceController.swift
//  test WatchKit Extension
//
//  Created by Vamsee Gangaram on 7/24/15.
//  Copyright (c) 2015 Vamsee Gangaram. All rights reserved.
//

import WatchKit
import Foundation




class InterfaceController: WKInterfaceController {
    var tapCoord = 0;
    
    @IBAction func SetPassword() {
        
    }
    
    @IBAction func UnlockButton() {
        
    }
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
