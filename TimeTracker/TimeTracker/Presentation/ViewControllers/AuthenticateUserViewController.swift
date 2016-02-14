//
//  AuthenticateUserViewController.swift
//  TimeTracker
//
//  Created by razor118 on 09.12.2015.
//  Copyright © 2015 WhallaLabs. All rights reserved.
//

import UIKit

class AuthenticateUserViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()

        var queryHandler = LoginQueryHandler();
        var query = LoginQuery(email: "casd", password: "kupa")
        var result = queryHandler.process(query)
        
        //signInButton.layer.borderColor = UIColor.whiteColor().CGColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("asd")
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
