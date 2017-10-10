
//
//  InterfaceController.swift
//  test WatchKit Extension
//
//  Created by Vamsee Gangaram on 7/24/15.
//  Copyright (c) 2015 Vamsee Gangaram. All rights reserved.
//

import WatchKit
import Foundation




class ConfirmPInterfaceController: WKInterfaceController {
    var MARGIN = 0.5; //margin of error allowed for a passcode attempt to be succesful
    var  tapCount = 0
    var tap1 = "1"
    var tap2 = "1"
    var tap3 = "1"
    var tap4 = "1"
    var duration1to2 = 0.0
    var duration2to3 = 0.0
    var duration3to4 = 0.0
    var currentTime = NSDate.timeIntervalSinceReferenceDate()
    var isDuration1to2OK = false
    var isDuration2to3OK = false
    var isDuration3to4OK = false
    
    
    @IBAction func button1() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        
        //record time of the first tap
        if self.tapCount == 1
        {
            tap1 = "1"
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 2
        {
            tap2 = "1"
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 3
        {
            tap3 = "1"
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 4
        {
            tap4 = "1"
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            
            //calculate the threshold that the attempted passcode must satisfy
            self.tapCount = 0
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") && isDuration1to2OK &&
                tap2 == defaults.stringForKey("tap2") && isDuration2to3OK &&
                tap3 == defaults.stringForKey("tap3") && isDuration3to4OK &&
                tap4 == defaults.stringForKey("tap4")
            {
                print("Password SUCCESSFUL!")
                presentControllerWithName("SuccessInterfaceController", context: nil)
                pushControllerWithName("MenuInterfaceController", context: nil)
            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainInterfaceController", context: nil)
                pushControllerWithName("SetPInterfaceController", context: nil)
            }
            
        }
        
    }
    
    @IBAction func button2() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        
        //record the time taken from tap 1 to tap 2
        if self.tapCount == 1
        {
            tap1 = "2"
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 2
        {
            tap2 = "2"
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 3
        {
            tap3 = "2"
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 4
        {
            tap4 = "2"
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            
            //calculate the threshold that the attempted passcode must satisfy
            self.tapCount = 0
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") && isDuration1to2OK &&
                tap2 == defaults.stringForKey("tap2") && isDuration2to3OK &&
                tap3 == defaults.stringForKey("tap3") && isDuration3to4OK &&
                tap4 == defaults.stringForKey("tap4")
            {
                print("Password SUCCESSFUL!")
                presentControllerWithName("SuccessInterfaceController", context: nil)
                pushControllerWithName("MenuInterfaceController", context: nil)
            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainInterfaceController", context: nil)
                pushControllerWithName("SetPInterfaceController", context: nil)
            }
            
        }
        
    }
    @IBAction func button3() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        
        //record the time taken from tap 2 to tap 3
        if self.tapCount == 1
        {
            tap1 = "3"
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 2
        {
            tap2 = "3"
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 3
        {
            tap3 = "3"
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 4
        {
            tap4 = "3"
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            
            //calculate the threshold that the attempted passcode must satisfy
            self.tapCount = 0
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") && isDuration1to2OK &&
                tap2 == defaults.stringForKey("tap2") && isDuration2to3OK &&
                tap3 == defaults.stringForKey("tap3") && isDuration3to4OK &&
                tap4 == defaults.stringForKey("tap4")
                
            {
                print("Password SUCCESSFUL!")
                presentControllerWithName("SuccessInterfaceController", context: nil)
                pushControllerWithName("MenuInterfaceController", context: nil)
            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainInterfaceController", context: nil)
                pushControllerWithName("SetPInterfaceController", context: nil)
            }
            
        }
        
    }
    @IBAction func button4() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
        
        //record the time taken from tap 3 to tap 4
        if self.tapCount == 1
        {
            tap1 = "4"
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 2
        {
            tap2 = "4"
            duration1to2 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 3
        {
            tap3 = "4"
            duration2to3 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
        }
        if self.tapCount == 4
        {
            tap4 = "4"
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            
            //calculate the threshold that the attempted passcode must satisfy
            self.tapCount = 0
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") && isDuration1to2OK &&
                tap2 == defaults.stringForKey("tap2") && isDuration2to3OK &&
                tap3 == defaults.stringForKey("tap3") && isDuration3to4OK &&
                tap4 == defaults.stringForKey("tap4")
            {
                print("Password SUCCESSFUL!")
                presentControllerWithName("SuccessInterfaceController", context: nil)
                pushControllerWithName("MenuInterfaceController", context: nil)
            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainInterfaceController", context: nil)
                pushControllerWithName("SetPInterfaceController", context: nil)
            }
            
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
