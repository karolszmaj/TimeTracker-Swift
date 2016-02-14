//
//  QueryHandler.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import RxSwift
protocol QueryHandler {
    typealias Input = Query
    typealias Output
    
    func process(query: Input) -> Output
}