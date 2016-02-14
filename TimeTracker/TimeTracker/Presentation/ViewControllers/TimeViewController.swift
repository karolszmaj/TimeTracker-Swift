//
//  TimeViewController.swift
//  TimeTracker
//
//  Created by razor118 on 13.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
import FSCalendar

class TimeViewController: UIViewModelController {
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var timeEntriesTableView: UITableView!

    private var dataSource: TimeEntriesDataSource!

    override func createViewModel() -> Screen? {
        var model = TimeEntriesViewModel()
        model.delegate = self
        return model
    }

    override func viewDidAppear(animated: Bool) {
        calendarView.selectDate(NSDate(), scrollToDate: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        timeEntriesTableView.allowsMultipleSelectionDuringEditing = false
        calendarView.scope = .Week
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onShowCurrentDateNotificationReceived:", name: NotificationCenterKeys.ShowTodayDate.rawValue, object: nil)
    }
    
    func onShowCurrentDateNotificationReceived(data: NSNotification) {
        calendarView.selectDate(NSDate(), scrollToDate: true)
    }
}

extension TimeViewController: TimeEntriesDelegate {
    func presentTimeEntries(entries: [TrackingEntry]) {
        dataSource = TimeEntriesDataSource(parentVC: self, cellIdentifier: "TimeEntryCell", timeEntries: entries)
        timeEntriesTableView.dataSource = dataSource
        timeEntriesTableView.reloadData()
    }
}