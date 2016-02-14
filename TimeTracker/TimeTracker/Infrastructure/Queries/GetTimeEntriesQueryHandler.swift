//
//  GetTimeEntriesQueryHandler.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import RxSwift
class GetTimeEntriesQueryHandler: QueryHandler {
    private let timeEntriesProvider: TimeEntriesProvidable

    init() {
        timeEntriesProvider = TimeEntriesProviderFactory.createStorageProvider()
    }

    func process(query: GetTimeEntriesQuery) -> Observable<[TrackingEntry]> {
        return timeEntriesProvider.getTrackings(query.date)
    }
}