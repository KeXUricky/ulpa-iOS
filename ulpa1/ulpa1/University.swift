//
//  Course.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// the struct of a university with its state, receive a json data and store as string
import Foundation
struct University {
    let state: String
    let school: String
    init? (json:JSON) {
        guard let stateName = json["state"] as? String,
             let schoolName = json["school"] as? String
            else  {return nil}
        self.state = stateName
        self.school = schoolName
        
        
        
    }
    
}


