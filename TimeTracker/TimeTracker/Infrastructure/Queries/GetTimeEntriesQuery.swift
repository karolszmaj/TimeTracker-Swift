//
//  GetTimeEntriesQuery.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
struct GetTimeEntriesQuery {
    /*let client: String
    let projectName: String
    let task: String
    let description: String
    
    init(client: String, projectName: String, task: String, description: String) {
        self.client = client
        self.description = description
        self.projectName = projectName
        self.task = task
    }*/
    let date: NSDate

    init(date: NSDate) {
        self.date = date
    }
}