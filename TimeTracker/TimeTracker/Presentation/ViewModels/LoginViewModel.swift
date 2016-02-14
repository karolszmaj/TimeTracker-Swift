//
//  LoginViewModel.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel: ScreenViewModel {
    var email: String = ""
    var password: String = ""
    
    func authorizeUser() -> Observable<Bool> {
        var query = LoginQuery(email: email,password: password)
        var queryHandler = LoginQueryHandler()
        return queryHandler.process(query)
    }
    
    override func onInitialize() {
        
    }
    
    override func onActivate() {
        
    }
    
    override func onDeactivate() {
        
    }
}