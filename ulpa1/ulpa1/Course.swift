//
//  Course.swift
//  ulpa1
//
//  Created by ke xu on 2017/9/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// the struct of a course, receive a json data and store as string
import Foundation
struct Course {
    
    let state:          String
    let classcode:      String
    let language:       String
    let school:         String
    let next_offered:   String
    let intensive:      String
    //let discription:     String
    let prerequisite:   String
    let study_choice:   String
   // let viaanother:     String
    let url:            String
    init? (json:JSON) {
        
    guard let state =           json["state"] as? String,
        let classcode =         json["code"] as? String,
        let intensity =         json["intensity"] as? String,
        let school =            json["school"] as? String,
        let language =          json["title"] as? String,
        //let prerequisite =          json["prerequisite"] as? String,
        //let discription =        json["discription"] as? String,
        let next_offered =      json ["next_offered"] as? String,
        let url =               json["url"] as? String,
        let study_choice =      json["study_choice"] as? String
       // let viaanother =        json["viaanother"] as? String
        else  {return nil}
        self.state = state
        self.classcode =    classcode
        self.language =     language
        self.school =       school
        self.next_offered =  next_offered
        self.intensive =   intensity
       // self.discription =   discription
        self.prerequisite =     "None"
        self.study_choice =      study_choice
        self.url = url
        
       // self.viaanother =   viaanother
        
    }
    
}
