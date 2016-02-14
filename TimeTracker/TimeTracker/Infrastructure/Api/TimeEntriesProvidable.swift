//
//  TimeEntriesProvidable.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import RxSwift
protocol TimeEntriesProvidable {
    func getTrackings(entriesForDate: NSDate) -> Observable<[TrackingEntry]>
}