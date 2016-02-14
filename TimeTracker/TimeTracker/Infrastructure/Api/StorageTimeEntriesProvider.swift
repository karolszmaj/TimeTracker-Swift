//
//  TimeEntriesProvider.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import RxSwift
class StorageTimeEntriesProvider: TimeEntriesProvidable {

    func getTrackings(entriesForDate: NSDate) -> Observable<[TrackingEntry]> {
        return Observable.create { observer  in
            observer.on(.Next(self.entries))
            observer.on(.Completed)
            return NopDisposable.instance
        }
    }

    private var entries: [TrackingEntry]
    private let storageProvider: StorageArrayService
    private let storageFilePath = "timeEntries.dat"
    
    init() {
        entries = [TrackingEntry]()
        storageProvider = StorageArrayService()
        entries = generateFakeEntries()
    }

    private func generateFakeEntries() -> [TrackingEntry] {
        var result = [TrackingEntry]()
        result.append(TrackingEntry(client: "Politechnika Poznańska", projectName: "Aplikacje Mobilne",task: "Development", description: "Implementacja projektu",date: NSDate(),loggedTime: Int64(Int.random(Range(start: 120, end:1480)))))
        result.append(TrackingEntry(client: "Politechnika Poznańska", projectName: "Sesja",task: "Learning", description: "Nauka na zaliczenie z przedmiotu X",date: NSDate(),loggedTime: Int64(Int.random(Range(start: 120, end:1480)))))
        result.append(TrackingEntry(client: "Whalla Labs", projectName: "Projekt",task: "Development", description: "Implementacja projektu",date: NSDate(),loggedTime: Int64(Int.random(Range(start: 120, end:1480)))))
        result.append(TrackingEntry(client: "Politechnika Poznańska", projectName: "Projekt",task: "Test", description: "Implementacja projektu",date: NSDate(),loggedTime: Int64(Int.random(Range(start: 120, end:1480)))))
        return result
    }
}