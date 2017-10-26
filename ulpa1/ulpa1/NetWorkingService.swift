//
//  NetWorkingService.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// the class handle the connect between client and the api
import Foundation
import Alamofire
import SwiftyJSON
typealias JSON = [String : Any ]
// http address to the api
var url_api = "http://localhost:3000/api/language/"
let url_languagename = "http://localhost:3000/api/languagename"
let url_stateSchool = "http://localhost:3000/api/stateSchool"
let url_getDescription = "http://localhost:3000/api/languageDescription"
var langlist = [String]()
class NetWoringService{
    
    static let shared = NetWoringService()
    private init(){}
    // get all information of a courses
    func getCourse(languagename:String , success successBlock: @escaping (GetCourseResponse) -> Void) {
        Alamofire.request(url_api+languagename).responseJSON { response in
            
            guard let json = response.result.value as? JSON else { return }
            do {
                let getCourseResponse = try GetCourseResponse(json: json)
                successBlock(getCourseResponse)
            } catch {}
        }
    }
    // get avalible  language list
    func getLanguageName(success successBlock: @escaping (GetLanguage) -> Void) {
        Alamofire.request(url_languagename).responseJSON { response in
            guard let json = response.result.value as? JSON else { return }
            do {
                let getLanguage = try GetLanguage(json: json)
                successBlock(getLanguage)
            } catch {}
        }
    }
    // get avalible  universities with its states
    func getStateSchoolName(success successBlock: @escaping (GetStateSchool) -> Void) {
        Alamofire.request(url_stateSchool).responseJSON { response in
            guard let json = response.result.value as? JSON else { return }
            do {
                let getschool = try GetStateSchool(json: json)
                successBlock(getschool)
            } catch {}
        }
    }
    // get all languages with its description
    func getLanguagedescription(success successBlock: @escaping (getDescription) -> Void) {
        Alamofire.request(url_getDescription).responseJSON { response in
            guard let json = response.result.value as? JSON else { return }
            do {
                let getdescription = try getDescription(json: json)
                successBlock(getdescription)
            } catch {}
        }
    }

}
