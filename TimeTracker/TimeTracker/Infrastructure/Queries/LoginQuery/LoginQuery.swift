//
//  LoginQuery.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
class LoginQuery: Query {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}