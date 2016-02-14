//
//  UINavigationViewController.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
extension UINavigationController {
    func removePreviousViewControllers() {
        self.viewControllers = [viewControllers.last!]
    }
}