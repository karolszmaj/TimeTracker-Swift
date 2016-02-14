//
//  TimeEntriesViewModel.swift
//  TimeTracker
//
//  Created by razor118 on 26.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import RxSwift
protocol TimeEntriesDelegate {
    func presentTimeEntries(entries: [TrackingEntry])
}

class TimeEntriesViewModel: ScreenViewModel {
    var delegate: TimeEntriesDelegate?

    override func onInitialize() {
        super.onInitialize()
        fetchTimeEntries()
    }

    private func fetchTimeEntries() {
        let query = GetTimeEntriesQuery(date: NSDate())
        let handler = GetTimeEntriesQueryHandler().process(query).subscribeNext { results in
            self.delegate?.presentTimeEntries(results)
        }
    }
}