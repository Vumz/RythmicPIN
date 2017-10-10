//
//  InterfaceController.swift
//  test WatchKit Extension
//
//  Created by Vamsee Gangaram on 7/24/15.
//  Copyright (c) 2015 Vamsee Gangaram. All rights reserved.
//

import WatchKit
import Foundation
import UIKit




class TrainingInterfaceController: WKInterfaceController {
    var MARGIN = 0.5;
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
    var numAttempts = 0;
    
    var D1attempts:[Double] = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
    var D2attempts:[Double] = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
    var D3attempts:[Double] = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]

    
    func average(nums: [Double]) -> Double {
        
        var total = 0.0
        //use the parameter-array instead of the global variable votes
        for vote in nums{
            
            total += Double(vote)
            
        }
        
        let votesTotal = Double(nums.count)
        let average = total/votesTotal
        return average
    }
    func maxEuclid(D1s: [Double], D2s: [Double], D3s: [Double], refD1: Double, refD2: Double, refD3: Double) -> Double {
        
        var max = 0.0
        var currEuclidean = 0.0
        var distance1:Double = 0.0;
        var distance2 = 0.0;
        var distance3 = 0.0;
        //use the parameter-array instead of the global variable votes
        for attempt in 0...9 {
            distance1 = (D1s[attempt]-refD1) * (D1s[attempt]-refD1)
            distance2 = (D2s[attempt]-refD2) * (D2s[attempt]-refD2)
            distance3 = (D3s[attempt]-refD3) * (D3s[attempt]-refD3)
            currEuclidean = sqrt(distance1 + distance2 + distance3)
            if (currEuclidean > max) {
                max = currEuclidean
            }
            
        }
        
        return max
    }
    
    func distanceOK( D1: Double, D2: Double, D3: Double) -> Bool {

        //get reference durations
        let defaults = NSUserDefaults.standardUserDefaults()
        let refD1 = defaults.doubleForKey("duration1to2")
        let refD2 = defaults.doubleForKey("duration2to3")
        let refD3 = defaults.doubleForKey("duration3to4")
        let refDistance = defaults.doubleForKey("maxDistance")
        
        
        let distance1 = (D1-refD1) * (D1-refD1)
        let distance2 = (D2-refD2) * (D2-refD2)
        let distance3 = (D3-refD3) * (D3-refD3)
        
        if (sqrt(distance1 + distance2 + distance3) > refDistance) {
            return false
        }
        else {
            return true
        }

    }



    
    @IBAction func button1() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
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
            
            //compute Euclidean distance

            
            self.tapCount = 0
            
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") &&
                tap2 == defaults.stringForKey("tap2") &&
                tap3 == defaults.stringForKey("tap3") &&
                tap4 == defaults.stringForKey("tap4") && distanceOK(duration1to2, D2: duration2to3, D3: duration3to4)
            {
                //display the time duration info
                print(String(format: "SUCCESSFUL, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                //store the attempt
                D1attempts[numAttempts] = duration1to2
                D2attempts[numAttempts] = duration2to3
                D3attempts[numAttempts] = duration3to4
                
                numAttempts = numAttempts + 1
                if (numAttempts == 10) {
                    //compute the centroid for all 10 attempts
                    let D1 = average(D1attempts)
                    let D2 = average(D2attempts)
                    let D3 = average(D3attempts)
                    
                    //store it as the password
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setDouble(D1, forKey:"duration1to2")
                    defaults.setDouble(D2, forKey:"duration2to3")
                    defaults.setDouble(D3, forKey:"duration3to4")
print(String(format: "Password is, %.2f, %.2f, %.2f", D1, D2, D3))

                    //compute euclidean distance for each attempt and take the maximum
                    let maxEuclidean:Double = maxEuclid(D1attempts, D2s:D2attempts, D3s:D3attempts, refD1:D1, refD2:D2, refD3:D3)
                    print(String(format: "MAX EUCLIDEAN: %.2f", maxEuclidean))
                    
                    //store it as the threshold
                    defaults.setDouble(maxEuclidean, forKey:"maxDistance");
                    
                    presentControllerWithName("SuccessInterfaceController", context: nil)
                    pushControllerWithName("MenuInterfaceController", context: nil)

                }
                else {
                    presentControllerWithName("SuccessTInterfaceController", context: nil)
                    usleep(5)
                    self.dismissController()
                }

                
               /* let cancel = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                    
                })
                
                let action = WKAlertAction(title: "Action", style: WKAlertActionStyle.Default, handler: { () -> Void in
                    
                })
                
                self.presentAlertControllerWithTitle("Alert", message: "Example watchOS 2 alert interface", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [])

                
                presentControllerWithName("TryAgainTInterfaceController", context: nil)
                usleep(5)
                self.dismissController()
*/
                
                //pushControllerWithName("TrainingInterfaceController", context: nil)
            }
            else
            {
                
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainTInterfaceController", context: nil)
                usleep(5)
                self.dismissController()
                //pushControllerWithName("TrainingInterfaceController", context: nil)
            }
            
        }
        
    }
    
    @IBAction func button2() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
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
            
            self.tapCount = 0
            
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") &&
                tap2 == defaults.stringForKey("tap2") &&
                tap3 == defaults.stringForKey("tap3") &&
                tap4 == defaults.stringForKey("tap4") && distanceOK(duration1to2, D2: duration2to3, D3: duration3to4)
            {
                //display the time duration info
                print(String(format: "SUCCESSFUL: %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                D1attempts[numAttempts] = duration1to2
                D2attempts[numAttempts] = duration2to3
                D3attempts[numAttempts] = duration3to4
                
                numAttempts = numAttempts + 1
                if (numAttempts == 10) {
                    //compute the centroid for all 10 attempts
                    let D1 = average(D1attempts)
                    let D2 = average(D2attempts)
                    let D3 = average(D3attempts)
                    
                    //store it as the password
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setDouble(D1, forKey:"duration1to2")
                    defaults.setDouble(D2, forKey:"duration2to3")
                    defaults.setDouble(D3, forKey:"duration3to4")
                    print(String(format: "Password is, %.2f, %.2f, %.2f", D1, D2, D3))
                    
                    //compute euclidean distance for each attempt and take the maximum
                    let maxEuclidean:Double = maxEuclid(D1attempts, D2s:D2attempts, D3s:D3attempts, refD1:D1, refD2:D2, refD3:D3)
                    print(String(format: "MAX EUCLIDEAN: %.2f", maxEuclidean))
                    
                    //store it as the threshold
                    defaults.setDouble(maxEuclidean, forKey:"maxDistance")
                    presentControllerWithName("SuccessInterfaceController", context: nil)
                    pushControllerWithName("MenuInterfaceController", context: nil)

                }
                else {
                    presentControllerWithName("SuccessTInterfaceController", context: nil)
                    usleep(5)
                    self.dismissController()
                }

                //pushControllerWithName("TrainingInterfaceController", context: nil)
            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                

                presentControllerWithName("TryAgainTInterfaceController", context: nil)
                usleep(5)
                self.dismissController()
                //pushControllerWithName("TrainingInterfaceController", context: nil)
            }
            
        }
        
    }
    @IBAction func button3() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
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
            tap4 = "4"
            duration3to4 = NSDate.timeIntervalSinceReferenceDate() - currentTime
            currentTime = NSDate.timeIntervalSinceReferenceDate()
            self.tapCount = 0
            
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") &&
                tap2 == defaults.stringForKey("tap2") &&
                tap3 == defaults.stringForKey("tap3") &&
                tap4 == defaults.stringForKey("tap4") && distanceOK(duration1to2, D2: duration2to3, D3: duration3to4)
            {
                //display the time duration info
                print(String(format: "SUCCESSFUL: %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                D1attempts[numAttempts] = duration1to2
                D2attempts[numAttempts] = duration2to3
                D3attempts[numAttempts] = duration3to4
                numAttempts = numAttempts + 1
                if (numAttempts == 10) {
                    //compute the centroid for all 10 attempts
                    let D1 = average(D1attempts)
                    let D2 = average(D2attempts)
                    let D3 = average(D3attempts)
                    
                    //store it as the password
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setDouble(D1, forKey:"duration1to2")
                    defaults.setDouble(D2, forKey:"duration2to3")
                    defaults.setDouble(D3, forKey:"duration3to4")
                    print(String(format: "Password is, %.2f, %.2f, %.2f", D1, D2, D3))
                    
                    //compute euclidean distance for each attempt and take the maximum
                    let maxEuclidean:Double = maxEuclid(D1attempts, D2s:D2attempts, D3s:D3attempts, refD1:D1, refD2:D2, refD3:D3)
                    print(String(format: "MAX EUCLIDEAN: %.2f", maxEuclidean))
                    
                    //store it as the threshold
                    defaults.setDouble(maxEuclidean, forKey:"maxDistance")
                    presentControllerWithName("SuccessInterfaceController", context: nil)
                    pushControllerWithName("MenuInterfaceController", context: nil)

                }
                else {
                    presentControllerWithName("SuccessTInterfaceController", context: nil)
                    usleep(5)
                    self.dismissController()
                }
                //pushControllerWithName("TrainingInterfaceController", context: nil)
            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainTInterfaceController", context: nil)
                usleep(5)
                self.dismissController()
                //pushControllerWithName("TrainingInterfaceController", context: nil)
            }
            
        }
        
    }
    @IBAction func button4() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.tapCount += 1;
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
            self.tapCount = 0
            
            isDuration1to2OK = (duration1to2 < (defaults.doubleForKey("duration1to2") + MARGIN)) && (duration1to2 > (defaults.doubleForKey("duration1to2") - MARGIN))
            
            isDuration2to3OK = duration2to3 < (defaults.doubleForKey("duration2to3") + MARGIN) && duration2to3 > (defaults.doubleForKey("duration2to3") - MARGIN)
            
            isDuration3to4OK = duration3to4 < (defaults.doubleForKey("duration3to4") + MARGIN) && (duration3to4 > (defaults.doubleForKey("duration3to4") - MARGIN))
            
            
            if  tap1 == defaults.stringForKey("tap1") &&
                tap2 == defaults.stringForKey("tap2") &&
                tap3 == defaults.stringForKey("tap3") &&
                tap4 == defaults.stringForKey("tap4") && distanceOK(duration1to2, D2: duration2to3, D3: duration3to4)
            {
                //display the time duration info
                print(String(format: "SUCCESSFUL, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                D1attempts[numAttempts] = duration1to2
                D2attempts[numAttempts] = duration2to3
                D3attempts[numAttempts] = duration3to4
                numAttempts = numAttempts + 1
                if (numAttempts == 10) {
                    //compute the centroid for all 10 attempts
                    let D1 = average(D1attempts)
                    let D2 = average(D2attempts)
                    let D3 = average(D3attempts)
                    
                    //store it as the password
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setDouble(D1, forKey:"duration1to2")
                    defaults.setDouble(D2, forKey:"duration2to3")
                    defaults.setDouble(D3, forKey:"duration3to4")
                    print(String(format: "Password is, %.2f, %.2f, %.2f", D1, D2, D3))
                    
                    //compute euclidean distance for each attempt and take the maximum
                    let maxEuclidean:Double = maxEuclid(D1attempts, D2s:D2attempts, D3s:D3attempts, refD1:D1, refD2:D2, refD3:D3)
                    print(String(format: "MAX EUCLIDEAN: %.2f", maxEuclidean))
                    
                    //store it as the threshold
                    defaults.setDouble(maxEuclidean, forKey:"maxDistance")
                    presentControllerWithName("SuccessInterfaceController", context: nil)
                    pushControllerWithName("MenuInterfaceController", context: nil)

                }
                else {
                    presentControllerWithName("SuccessTInterfaceController", context: nil)
                    usleep(5)
                    self.dismissController()
                }

            }
            else
            {
                print(String(format: "FAILED, %.2f, %.2f, %.2f", duration1to2, duration2to3, duration3to4))
                presentControllerWithName("TryAgainTInterfaceController", context: nil)
                usleep(5)
                self.dismissController()
               // pushControllerWithName("TrainingInterfaceController", context: nil)
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
