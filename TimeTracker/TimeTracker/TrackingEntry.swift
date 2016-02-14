//
//  TrackingEntry.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
struct TrackingEntry {
    let client: String
    let projectName: String
    let task: String
    let description: String
    let date: NSDate
    let loggedTime: Int64
    
    init(client: String, projectName: String, task: String, description: String, date: NSDate, loggedTime: Int64) {
        self.client = client
        self.description = description
        self.projectName = projectName
        self.task = task
        self.date = date
        self.loggedTime = loggedTime
    }
}