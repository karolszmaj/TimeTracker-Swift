//
//  ViewModelAware.swift
//  TimeTracker
//
//  Created by razor118 on 26.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
protocol ViewModelAware {
    func initializeViewModel()
    func activateViewModel()
    func deactivateViewModel()
    func createViewModel() -> Screen?
}

