//
//  contact.swift
//  ulpa1
//
//  Created by KE XU on 2017/9/18.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// check the input of contact, especially whether 
//the contact number and email-address is valid
import Foundation
import UIKit
class contact :UIViewController,UITextFieldDelegate{
    let substr1 = "@"
    let substr2 = ".com"

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var yourMessage: UITextView!
    @IBOutlet weak var textbox1: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var lastname: UITextField!

    @IBOutlet weak var firstname: UITextField!
    override func viewDidLoad() {
        
        self.yourMessage.layer.borderWidth = 1
      
        self.yourMessage.layer.borderColor = UIColor.black.cgColor

        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //  move the scrollview to proper position
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == phonenumber{
            self.inputView?.becomeFirstResponder()
            scrollView.setContentOffset(CGPoint.init(x:0, y: 100), animated: true)
        }
        if textField == email{
            scrollView.setContentOffset(CGPoint.init(x:0, y: 150), animated: true)
        }
        if textField == lastname{
            scrollView.setContentOffset(CGPoint.init(x:0, y: 50), animated: true)
        }

        
    }
    // return to initial position after editting 
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint.init(x:0, y: -64), animated: true)
    }
    
    // check input of each textfield 
    @IBAction func submitButton(_ sender: UIButton) {
        if self.yourMessage.text == "" {
            let myAlert = UIAlertController(title: "Can't send empty message!",
                                            message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            myAlert.addAction(cancelAction)
            self.present(myAlert,animated: true,completion: nil)
        }
        else if self.firstname.text == "" {
            let myAlert = UIAlertController(title: "First name cannot be empty!",
                                            message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            myAlert.addAction(cancelAction)
            self.present(myAlert,animated: true,completion: nil)
        }
        else if self.lastname.text == "" {
            let myAlert = UIAlertController(title: "Last name cannot be empty!",
                                            message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            myAlert.addAction(cancelAction)
            self.present(myAlert,animated: true,completion: nil)
        }
            
        else if isPurnInt(string: self.phonenumber.text!){
            if (self.email.text?.range(of: self.substr1)) != nil && (self.email.text?.range(of: self.substr2)) != nil{
                
                let myAlert = UIAlertController(title: "Send!",
                                                message: "Message sent successfully", preferredStyle: UIAlertControllerStyle.alert)
                self.present(myAlert,animated: true,completion: nil)
                 DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
                 self.presentedViewController?.dismiss(animated: false, completion: nil)
                 }
            }
            else {
                let myAlert = UIAlertController(title: "Invalid Email Address!",
                                                message: nil, preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                myAlert.addAction(cancelAction)
                self.present(myAlert,animated: true,completion: nil)
            }
        }
        else
        {
            let myAlert = UIAlertController(title: "Contact Number must be numbers!",
                                            message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            myAlert.addAction(cancelAction)
            self.present(myAlert,animated: true,completion: nil)
        }

    }
    override func didReceiveMemoryWarning() {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
    }
    //check whether a string can be int
    func isPurnInt(string: String) -> Bool {
        
        let scan: Scanner = Scanner(string: string)
        
        var val:Int = 0
        
        return scan.scanInt(&val) && scan.isAtEnd
        
    }
    
}

