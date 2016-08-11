//
//  ViewController.swift
//  Phone Validator
//
//  Created by Abdul Aziz on 11/08/16.
//  Copyright © 2016 Abdul Aziz. All rights reserved.
//

import UIKit
import PhoneNumberKit


class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var validateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: Actions
    @IBAction func validateNumber(sender: UIButton) {
        let mobileNumber = mobileTextField.text!
        if mobileNumber != "" {
            do{
                let phoneNumber = try PhoneNumber(rawNumber: mobileNumber)
                if (phoneNumber.isValidNumber){
                    goToDialer(mobileNumber)
                }
                else{
                    showAlert("Invalid Number")
                }
            }catch{
                showAlert("Number Parse Error. Invalid Number")
            }
        }
    }
    
    //MARK: Helpers
    func showAlert(message : String){
        mobileTextField.text = ""
        let alert: UIAlertController = UIAlertController(title: "Error",
                                        message: message,preferredStyle: .Alert)
        let action = UIAlertAction(title: "Dismiss", style: .Default,
                                   handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)

    }
    
    //Calls the dialer. Currently fails.
    func goToDialer(number: String){
        print("Valid")
        let phoneNumber = ("tel://\(number)")
        let phoneURL: NSURL = NSURL(string: phoneNumber)!
        print(UIApplication.sharedApplication().canOpenURL(phoneURL))
        UIApplication.sharedApplication().openURL(phoneURL)
    }
    
}

