//
//  GetLanguage.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/30.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// get the data whose structure can be save as Description from api 
import Foundation
struct getDescription {
    let  description: [Description]
    
    
    init(json: JSON) throws {
        
        guard let results = json["data"] as? [JSON] else { throw NetWorkingError.badNetWorking }
        
        let description = results.map{ Description(json: $0) }.flatMap{ $0 }
        
        self.description = description
        
        
    }
}

