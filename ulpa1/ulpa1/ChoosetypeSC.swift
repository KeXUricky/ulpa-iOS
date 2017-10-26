//
//  ChooseStudyType.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/30.
//  Copyright © 2017年 Unimelb. All rights reserved.
// using pickrview to creat a dropdown meue
// defaut value of textfield is "both" and changed only by the text of the dropbox
// the textfield is read only

import Foundation
import UIKit
class ChoosetypeSC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var langlist = [String]()
    var schoolList = [String]()
    var isIntensive = ""
    var studyType = ""
    @IBOutlet weak var textbox1: UITextField!
    @IBOutlet weak var textbox2: UITextField!
    
    @IBOutlet weak var dropdown1: UIPickerView!
    
    @IBOutlet weak var dropdown2: UIPickerView!
    
    
    
    var intensive = ["Regular","Intensive","Both"]
    var studyChoice = ["Fully online","On-Campus","Both"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! languageVVC
        controller.langlist = self.langlist
        controller.intensive = self.textbox1.text!
        controller.studyType = self.textbox2.text!
        controller.schoolLists = self.schoolList
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = intensive.count
        if pickerView == dropdown2 {
            
            countrows = self.studyChoice.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dropdown1 {
            
            let titleRow = intensive[row]
            
            return titleRow
            
        }
            
        else if pickerView == dropdown2{
            let titleRow = studyChoice[row]
            
            return titleRow
        }
        
        return ""
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dropdown1 {
            self.textbox1.text = self.intensive[row]
            
            
        }
            
        else if pickerView == dropdown2{
            self.textbox2.text = self.studyChoice[row]
            
            
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.textbox1){
            self.dropdown1.isHidden = false
            
        }
        else if (textField == self.textbox2){
            self.dropdown2.isHidden = false
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textbox1.text = "Both"
        self.textbox2.text = "Both"
        print(self.langlist)
        print(self.schoolList)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toLanVC(_ sender: AnyObject) {
        self.isIntensive = self.textbox1.text!
        self.studyType = self.textbox2.text!
        
    }
    
}

