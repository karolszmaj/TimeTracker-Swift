//
//  LoginQueryHandler.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import RxSwift
class LoginQueryHandler: QueryHandler {
    func process(query: LoginQuery) -> Observable<Bool> {
        if query.email == "karol.szmaj@whallalabs.com" &&  query.password == "zxc" {
            return [true].toObservable()
        } else {
            return [false].toObservable()
        }
    }
}