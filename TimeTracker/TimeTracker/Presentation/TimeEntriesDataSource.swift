//
//  TimeEntriesDataSource.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
class TimeEntriesDataSource: NSObject, UITableViewDataSource {
    private let cellIdentifier: String
    private var trackingEntries: [TrackingEntry]
    private let parentVC: UIViewController
    
    init(parentVC: UIViewController, cellIdentifier: String, timeEntries: [TrackingEntry]) {
        self.trackingEntries = timeEntries
        self.cellIdentifier = cellIdentifier
        self.parentVC = parentVC
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! TimeTrackingCell
        var entry = trackingEntries[indexPath.row]
        cell.initialize(entry.client, projectName: entry.projectName, taskName: entry.task, description: entry.description, loggedSeconds: entry.loggedTime)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackingEntries.count
    }
}

extension TimeEntriesDataSource: TimeTrackingCellDelegate {
    func presentActionSheet(viewController: UIViewController) {
        parentVC.presentViewController(viewController, animated: true, completion: nil)
    }
}