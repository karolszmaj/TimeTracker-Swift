//
//  LoginViewValidator.swift
//  TimeTracker
//
//  Created by razor118 on 13.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import Foundation
import SwiftValidator

class LoginViewValidator {
    private let viewController: LoginViewController
    private let fieldValidator: Validator
    var isValid: Bool!
    
    init(loginController: LoginViewController) {
        self.viewController = loginController
        fieldValidator = Validator()
        registerValidationRules()
    }
    
    func validate() -> Bool {
        fieldValidator.validate(self)
        return isValid
    }
    private func registerValidationRules() {
        fieldValidator.registerField(viewController.emailAddressField, rules: [EmailRule(message: "Incorrect email address")])
        fieldValidator.registerField(viewController.passwordField, rules: [RequiredRule(message: "Password is required")])
    }
}

extension LoginViewValidator: ValidationDelegate {
    @objc func validationSuccessful() {
        isValid = true
    }
    
    @objc func validationFailed(errors: [UITextField:ValidationError]) {
        isValid = false
        var validationMessage = ""
        for (field, error) in fieldValidator.errors {
            validationMessage.appendContentsOf("⋅ \(error.errorMessage) \n")
        }
        
        var alert = UIAlertController(title: "Form error", message: validationMessage, preferredStyle: .Alert)
        var alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(alertAction)
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
}