//
//  QueryProcessor.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
import RxSwift
class QueryProcessor {
    typealias QueryMapping = (query: Query, queryHandler: AnyObject)
    var mappings: [QueryMapping]?
    
    init() {
        mappings = [QueryMapping]();
        mappings?.append(QueryMapping(query: LoginQuery(email: "asdad@", password: "adas"), queryHandler: LoginQueryHandler()))
    }
    
    func execute<Tin: Query, TOut: QueryHandler>(query: Tin) -> TOut {
       
        var queryHandlerName = TOut.self
        var queryHandlerInstance: TOut = NSClassFromString("TimeTracker.\(queryHandlerName)") as! TOut
        
        var result:Observable<String>? = queryHandlerInstance.process(query)
        
        
        //queryType.subjectType
        //1 locate query Handler
        //mappings?.filter({$0.query.dynamicType.className() == queryType.subjectType})
        
        return "asd" as! TOut
    }
}