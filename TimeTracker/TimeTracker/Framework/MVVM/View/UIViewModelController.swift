//
//  UIViewModelController.swift
//  TimeTracker
//
//  Created by razor118 on 26.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
class UIViewModelController: UIViewController, ViewModelAware {
    private var model: Screen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = createViewModel()
        initializeViewModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        activateViewModel()
    }
    
    override func viewDidDisappear(animated: Bool) {
        deactivateViewModel()
    }
    
    func initializeViewModel() {
        model?.onInitialize()
    }
    
    func activateViewModel() {
        model?.onActivate()
    }
    
    func deactivateViewModel() {
        model?.onDeactivate()
    }
    
    func createViewModel() -> Screen? {
        return nil;
    }
}