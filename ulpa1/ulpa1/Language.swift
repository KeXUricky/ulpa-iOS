//
//  Course.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// the struct of a language, receive a json data and store as string
import Foundation
struct Language {
    
    let languageName: String
    init? (json:JSON) {
        guard let languagename = json["name"] as? String
        else  {return nil}
        self.languageName = languagename
        
        
        
    }
    
}

