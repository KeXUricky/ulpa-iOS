//
//  ViewController.swift
//  ulpa1
//
//  Created by Ke XU on 2017/9/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//// the seaech result of search by language
// list the subject code and school name of the search result
import UIKit

class LanguageVC: UIViewController {
    var course = [Course]()
    var langlist = [String]()
    var intensive : String!
    var studyType : String!
    //var langlist = ["French","German"]
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad(){
        self.langlist = self.langlist.filterDuplicates({$0})
 
        for lang in langlist{
                NetWoringService.shared.getCourse(languagename: lang){ response in
                    for cours in response.course{
                        if cours.intensive == self.intensive || self.intensive == "Both" {
                            if cours.study_choice == self.studyType || self.studyType == "Both"{
                                self.course.append(cours)
                            }
                        }
                    }
                
                self.tableView.reloadData()
                
            }
            
            
        }
        
        /*NetWoringService.shared.getCourse(url: api_ad+language){ response in
        self.course = response.course
        self.tableView.reloadData()
        }*/
    }
    //send the data to next story board
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "CourseToDetail",
            let detailVC = segue.destination as? DetailVC,
            let course = sender as AnyObject as? Course else {return}
            detailVC.course = course
    }

}






extension LanguageVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = course[indexPath.row].classcode + " " + course[indexPath.row].school
        return cell
    }
}

extension LanguageVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CourseToDetail", sender: course[indexPath.row])
    }
}
extension Array {
    // an function to filter duplicates items in an array
    func filterDuplicates<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
}

