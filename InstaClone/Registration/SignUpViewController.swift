//
//  SignUpViewController.swift
//  InstaClone
//
//  Created by Chris Mendez on 4/18/16.
//  Copyright © 2016 Chris Mendez. All rights reserved.
//

import UIKit
class SignUpViewController: UIViewController {

   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var userIcon:UIImageView!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: TextField!

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: TextField!

    @IBOutlet weak var fNameLabel:UILabel!
    @IBOutlet weak var fNameTextField:TextField!

    @IBOutlet weak var lNameLabel:UILabel!
    @IBOutlet weak var lNameTextField:TextField!
    
    @IBOutlet weak var signupButton: Button!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBAction func onSignup(sender: AnyObject) {
    }
    
    @IBAction func onCancel(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    weak var activeField:TextField?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = self.view.frame.height
        
        listenToKeyboard()
    }
}

//KEYBOARD RELATED FUNCTIONS
extension SignUpViewController {
    
    func listenToKeyboard(){
        //Check to see if keyboard is shown or not
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardDidShow(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        //Hide Keyboard if tapped
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(self.onKeyboardTap(_:)))
            hideTap.numberOfTapsRequired = 1
        //self.view.userInteractionEnabled = true
        //self.view.addGestureRecognizer(hideTap)
    }
    
    func onKeyboardTap(recognizer:UITapGestureRecognizer){
        print("onKeyboardTap", recognizer)
        self.view.endEditing(true)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        if let activeField = self.activeField, keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!CGRectContainsPoint(aRect, activeField.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
}

extension SignUpViewController:UITextFieldDelegate  {
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeField = nil
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = (textField as! TextField)
    }
}
