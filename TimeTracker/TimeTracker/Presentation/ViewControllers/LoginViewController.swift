//
//  LoginViewController.swift
//  TimeTracker
//
//  Created by razor118 on 10.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit
import SwiftLoader
import RxCocoa
import RxSwift
class LoginViewController: UIViewModelController {
    private var viewModel: LoginViewModel!
    private var validator: LoginViewValidator!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func createViewModel() -> Screen? {
        viewModel = LoginViewModel()
        return viewModel
    }
    
    deinit {
        print("deallocated")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        validator = LoginViewValidator(loginController: self)
        
        passwordField.rx_text.subscribeNext { (data) -> Void in
            self.viewModel.password = data
        }
        emailAddressField.rx_text.subscribeNext { (data) -> Void in
            self.viewModel.email = data
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButtonPressed(sender: AnyObject) {
        if(validator.validate() == false) {
            return;
        }
        
        SwiftLoader.show(animated: true)
        viewModel.authorizeUser().delaySubscription(2.5, scheduler: MainScheduler.instance)
            .subscribeNext { (result) -> Void in
            SwiftLoader.hide()
            if result {
                self.performSegueWithIdentifier("showHubSegue", sender: self)
            } else {
                var alertController = UIAlertController(title: "Authorization", message: "Email or password is incorrect", preferredStyle: .Alert)
                var alertOk = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(alertOk)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
