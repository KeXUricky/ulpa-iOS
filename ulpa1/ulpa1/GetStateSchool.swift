//
//  GetLanguage.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/30.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// get the data whose structure can be save as University from api 
import Foundation
struct GetStateSchool {
    let  university: [University]
    
    
    init(json: JSON) throws {
        
        guard let results = json["data"] as? [JSON] else { throw NetWorkingError.badNetWorking }
        
        let university = results.map{ University(json: $0) }.flatMap{ $0 }
        
        self.university = university
        
        
    }
}

