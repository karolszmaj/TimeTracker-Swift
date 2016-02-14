//
//  TopHubHeaderViewController.swift
//  TimeTracker
//
//  Created by razor118 on 13.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
class TopHubHeaderViewController: UIViewController {
    
    @IBOutlet weak var currentDateButton: UIButton!
    @IBOutlet weak var caldarDayLabel: UILabel!
    @IBAction func onAddNewTrackingHandler(sender: AnyObject) {
        debugPrint("new item required")
    }
    
    override func viewDidLoad() {
        initializeDateLabel()
        initializeCalendarDayLabel()
    }
    
    @IBAction func onDateTappedHandler(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(NotificationCenterKeys.ShowTodayDate.rawValue, object: self)
    }
    
    private func initializeDateLabel() {
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "EEEE, dd MMM"
        let date = dateFormatter.stringFromDate(NSDate())
        currentDateButton.setTitle(date, forState: .Normal)
    }
    
    private func initializeCalendarDayLabel() {
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "dd"
        let date = dateFormatter.stringFromDate(NSDate())
        caldarDayLabel.text = date
    }
}