//
//  languageDescription.swift
//  ulpa1
//
//  Created by Ke XU on 2017/10/17.
//  Copyright © 2017年 Unimelb. All rights reserved.
//a label and a textview to display the name and description of a language

import Foundation
import UIKit
class languageDescription: UIViewController {
    var info: Description!
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var detail: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = info.languageName + ": "
        detail.text = info.language_description
        
        
    }
}
