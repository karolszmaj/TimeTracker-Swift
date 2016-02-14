//
// Created by razor118 on 29.12.2015.
// Copyright (c) 2015 WhallaLabs. All rights reserved.
//

import Foundation

class TimeEntriesProviderFactory {
    static func createStorageProvider() -> TimeEntriesProvidable {
        return StorageTimeEntriesProvider()
    }
}
