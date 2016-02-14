//
//  StorageArrayService.swift
//  TimeTracker
//
//  Created by razor118 on 28.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
class StorageArrayService {
    
    let directoryPath: String
    
    init() {
        directoryPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + "/";
    }
    
    func save(data: NSArray, fileName: String) {
        let filePath = getFilePath(fileName)
        data.writeToFile(filePath, atomically: true)
    }
    
    func load<T>(fileName: String) -> [T] {
        let filePath = getFilePath(fileName)
        let array = NSArray(contentsOfFile: filePath) as? [T]
        
        return array ?? [T]()
    }
    
    private func getFilePath(fileName: String) -> String {
        return directoryPath + fileName
    }
}