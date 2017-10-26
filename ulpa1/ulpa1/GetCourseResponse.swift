//
//  GetCourseResponse.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// get the data whose structure can be save as Course from api 
import Foundation

struct GetCourseResponse {
    let  course: [Course]
    
    init(json: JSON) throws {
        guard let results = json["data"] as? [JSON] else { throw NetWorkingError.badNetWorking }
        let course = results.map{ Course(json: $0) }.flatMap{ $0 }
        self.course = course
        
    }
}
