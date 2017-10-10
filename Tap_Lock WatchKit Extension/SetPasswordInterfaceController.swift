//
//  InterfaceController.swift
//  test WatchKit Extension
//
//  Created by Vamsee Gangaram on 7/24/15.
//  Copyright (c) 2015 Vamsee Gangaram. All rights reserved.
//

import WatchKit
import Foundation




class SetPasswordInterfaceController: WKInterfaceController {
    
    //set variables
    var  tapCount = 0
    var duration1to2 = 0.0
    var duration2to3 = 0.0
    var duration3to4 = 0.0
    var currentTime = NSDate.timeIntervalSinceReferenceDate()
    let defaults = NSUserDefaults.standardUserDefaults()

    //set button1 functionality
    @IBAction func button1() {
        
        self.tapCount += 1;
        if self.tapCount == 1
        {
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setObject("1", forKey: "tap1")
        }
        if self.tapCount == 2
        {
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration1to2, forKey:"duration1to2")
            defaults.setObject("1", forKey: "tap2")
        }
        if self.tapCount == 3
        {
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration2to3, forKey:"duration2to3")
            defaults.setObject("1", forKey: "tap3")
        }
        if self.tapCount == 4
        {
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration3to4, forKey:"duration3to4")
            defaults.setObject("1", forKey: "tap4")
            self.tapCount = 0
            pushControllerWithName("ConfirmPInterfaceController", context: nil)
            
            print("Your Password is: ", defaults.stringForKey("tap1"), defaults.doubleForKey("duration1to2"), defaults.stringForKey("tap2"), defaults.doubleForKey("duration2to3"), defaults.stringForKey("tap3"), defaults.doubleForKey("duration3to4"), defaults.stringForKey("tap4"))
            
            defaults.setDouble(0.5, forKey: "maxDistance")
            
        }
        
    }
    
    //set button2 functionality
    @IBAction func button2() {
        //let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        if self.tapCount == 1
        {
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setObject("2", forKey: "tap1")
        }
        if self.tapCount == 2
        {
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration1to2, forKey:"duration1to2")
            
            defaults.setObject("2", forKey: "tap2")
        }
        if self.tapCount == 3
        {
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration2to3, forKey:"duration2to3")
            defaults.setObject("2", forKey: "tap3")
        }
        if self.tapCount == 4
        {
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration3to4, forKey:"duration3to4")
            
            defaults.setObject("2", forKey: "tap4")
            self.tapCount = 0
            pushControllerWithName("ConfirmPInterfaceController", context: nil)
            
            print("Your Password is: ", defaults.stringForKey("tap1"), defaults.doubleForKey("duration1to2"), defaults.stringForKey("tap2"), defaults.doubleForKey("duration2to3"), defaults.stringForKey("tap3"), defaults.doubleForKey("duration3to4"), defaults.stringForKey("tap4"))
            
            defaults.setDouble(0.5, forKey: "maxDistance")
            
        }
        
    }
    
    //set button3 functionality
    @IBAction func button3() {
        //let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        if self.tapCount == 1
        {
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setObject("3", forKey: "tap1")
        }
        if self.tapCount == 2
        {
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration1to2, forKey:"duration1to2")
            
            defaults.setObject("3", forKey: "tap2")
        }
        if self.tapCount == 3
        {
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration2to3, forKey:"duration2to3")
            defaults.setObject("3", forKey: "tap3")
        }
        if self.tapCount == 4
        {
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration3to4, forKey:"duration3to4")
            
            defaults.setObject("3", forKey: "tap4")
            self.tapCount = 0
            pushControllerWithName("ConfirmPInterfaceController", context: nil)
            
            print("Your Password is: ", defaults.stringForKey("tap1"), defaults.doubleForKey("duration1to2"), defaults.stringForKey("tap2"), defaults.doubleForKey("duration2to3"), defaults.stringForKey("tap3"), defaults.doubleForKey("duration3to4"), defaults.stringForKey("tap4"))
            
            defaults.setDouble(0.5, forKey: "maxDistance")
            
        }
        
    }
    
    //set button4 functionality
    @IBAction func button4() {
        //let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        if self.tapCount == 1
        {
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setObject("4", forKey: "tap1")
        }
        if self.tapCount == 2
        {
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration1to2, forKey:"duration1to2")
            
            defaults.setObject("4", forKey: "tap2")
        }
        if self.tapCount == 3
        {
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration2to3, forKey:"duration2to3")
            defaults.setObject("4", forKey: "tap3")
        }
        if self.tapCount == 4
        {
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            defaults.setDouble(duration3to4, forKey:"duration3to4")
            
            defaults.setObject("4", forKey: "tap4")
            self.tapCount = 0
            pushControllerWithName("ConfirmPInterfaceController", context: nil)
            
            print("Your Password is: ", defaults.stringForKey("tap1"), defaults.doubleForKey("duration1to2"), defaults.stringForKey("tap2"), defaults.doubleForKey("duration2to3"), defaults.stringForKey("tap3"), defaults.doubleForKey("duration3to4"), defaults.stringForKey("tap4"))
            
            defaults.setDouble(0.5, forKey: "maxDistance")
            
        }
        
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
