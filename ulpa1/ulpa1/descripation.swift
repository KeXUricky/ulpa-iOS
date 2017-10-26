//
//  ViewController.swift
//  ulpa1
//
//  Created by Ke XU on 2017/9/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//this class is the language description ,show the name of language 
// send the specific description to next storyboard

import UIKit

class descripation: UIViewController {
    var course = [Course]()
    var langlist = [String]()
    var intensive : String!
    var studyType : String!
    var descr = [Description]()
    //var langlist = ["French","German"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad(){
        
            NetWoringService.shared.getLanguagedescription{ response in
                for x in response.description{
                    self.descr.append(x)
                }         
                self.tableView.reloadData()
                
            }
            
            
        
        
        /*NetWoringService.shared.getCourse(url: api_ad+language){ response in
         self.course = response.course
         self.tableView.reloadData()
         }*/
    }
    // send selection object to destination view ontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "seeDescription",
            let ld = segue.destination as? languageDescription,
            let descraaa = sender as AnyObject as? Description else {return}
            ld.info = descraaa
    }
    
}





// control the tableview to disaplay the infomation 
extension descripation:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = descr[indexPath.row].languageName
        return cell
    }
}

extension descripation:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seeDescription", sender: descr[indexPath.row])
    }
}


