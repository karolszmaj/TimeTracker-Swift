//
//  TimeTrackingCell.swift
//  TimeTracker
//
//  Created by razor118 on 26.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit

protocol TimeTrackingCellDelegate {
    func presentActionSheet(viewController: UIViewController)
}
class TimeTrackingCell: UITableViewCell {
    
    @IBOutlet weak var trackingImageView: UIImageView!
    @IBOutlet weak var clientLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hoursWithMinutesLabel: UILabel!
    var delegate: TimeTrackingCellDelegate?
    
    func initialize(clientName: String, projectName: String, taskName: String, description: String, loggedSeconds: Int64) {
        self.clientLabel.text = clientName
        self.projectLabel.text = projectName
        self.taskLabel.text = taskName
        self.descriptionLabel.text = description
        self.hoursWithMinutesLabel.text = formatSecondsToTextLabel(loggedSeconds)
        self.trackingImageView.hidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showActions")
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func showActions() {
        let sheetView = UIAlertController(title: projectLabel.text!, message: taskLabel.text!, preferredStyle: .ActionSheet)
        let startAction = UIAlertAction(title: "Start timer", style: .Default) { (action) -> Void in
            self.trackingImageView.hidden = false
        }
        
        let stopAction = UIAlertAction(title: "Stop timer", style: .Default) { (action) -> Void in
            self.trackingImageView.hidden = true
        }
        
        let editAction = UIAlertAction(title: "Edit", style: .Default) { (action) -> Void in
            //
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            
        }
        
        sheetView.addAction(stopAction)
        sheetView.addAction(startAction)
        sheetView.addAction(editAction)
        sheetView.addAction(cancelAction)
        delegate?.presentActionSheet(sheetView)
    
    }

    private func formatSecondsToTextLabel(timeInSeconds: Int64) -> String {
        let forrmatedTime = secondsToHoursMinutesSeconds(Int(timeInSeconds))
        let hours = NSString(format: "%02d", forrmatedTime.0)
        let minutes = NSString(format: "%02d", forrmatedTime.1)

        return "\(hours):\(minutes)"
    }

    private func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}