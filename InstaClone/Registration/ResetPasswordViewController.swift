//
//  ResetPasswordViewController.swift
//  InstaClone
//
//  Created by Chris Mendez on 4/18/16.
//  Copyright © 2016 Chris Mendez. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var emailTextField: TextField!
    
    
    @IBAction func onResetPassword(sender: AnyObject) {
        
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
