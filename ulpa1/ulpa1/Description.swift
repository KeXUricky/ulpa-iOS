//
//  Course.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//

import Foundation
struct Description {
    
    let languageName: String
    let language_description: String
    init? (json:JSON) {
        guard let languagename = json["name"] as? String,
            let languageDes = json["description"] as? String
            else  {return nil}
        self.languageName = languagename
        self.language_description = languageDes
        
        
        
    }
    
}


