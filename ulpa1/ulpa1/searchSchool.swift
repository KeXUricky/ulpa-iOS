//
//  searchState.swift
//  ulpa1
//
//  Created by ke XU on 2017/10/07.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
// show the avilable universities of choosen states that user can choose
import Foundation
import UIKit

class searchSchool: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items = [String]()
    var stateList = [String]()
    var university = [University]()


    var schoolList = [String]()
    

    var selectedIndexs = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.stateList)
        var templist = [String]()
        
        NetWoringService.shared.getStateSchoolName{ response in
            self.university = response.university
            for lang in self.university{
                if self.stateList.contains(lang.state){
                    templist.append(lang.school)
                }
            }
            let se = Set(templist)
            self.items = Array(se)
            self.tableView.reloadData()
        }
        //create a cell that can be reused
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! languageAfterSchool
        controller.schoolList = self.schoolList
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {

            let identify:String = "SwiftCell"

            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                     for: indexPath) as UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            

            if selectedIndexs.contains(indexPath.row) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let index = selectedIndexs.index(of: indexPath.row){
            selectedIndexs.remove(at: index) 
        }else{
            selectedIndexs.append(indexPath.row)
        }
        
        ////refresh after editing
        self.tableView?.reloadRows(at: [indexPath], with: .automatic)
    }
    

    @IBAction func btnClick(_ sender: AnyObject) {
        self.schoolList.removeAll()
        for index in selectedIndexs {
            self.schoolList.append(items[index])
        }
        if self.schoolList.count == 0{
            let myAlert = UIAlertController(title: "You must select at least one university!",
                                            message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            myAlert.addAction(cancelAction)
            self.present(myAlert,animated: true,completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

