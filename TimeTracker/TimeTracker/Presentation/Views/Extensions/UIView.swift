//
//  CALayer.swift
//  TimeTracker
//
//  Created by razor118 on 09.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
extension CALayer {
    public var borderUIColor: UIColor? {
        get {
            return UIColor(CGColor: borderColor!)
        }
        set {
            borderColor = newValue?.CGColor
        }
    }
}