//
//  languageAfterSchool.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
//mutiple choose the language that user wants to study after select the schools


import UIKit

class languageAfterSchool: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var items:[String] = []
    var lanuguage = [Language]()
    var schoolList = [String]()
    var selectedIndexs = [Int]()
    var lanName = [String]()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    //var tableView:UITableView?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var templist = [String]()
        //print(self.schoolList)
        NetWoringService.shared.getLanguageName{ response in
            self.lanuguage = response.language
            for lang in self.lanuguage{
                templist.append(lang.languageName)
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
    
    
    //only one section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ChoosetypeSC
        controller.langlist = self.lanName
        controller.schoolList = self.schoolList
    }
    //retuen the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
           
            let identify:String = "SwiftCell"
       
            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                     for: indexPath) as UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            
          // check whether the row is choosen
            if selectedIndexs.contains(indexPath.row) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
    }
    
    // UITableViewDelegate 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let index = selectedIndexs.index(of: indexPath.row){
            selectedIndexs.remove(at: index) //delete the selection
        }else{
            selectedIndexs.append(indexPath.row) 
        }
        
     
        self.tableView?.reloadRows(at: [indexPath], with: .automatic)
    }
    
  
    @IBAction func btnClick(_ sender: AnyObject) {
        lanName.removeAll()
        for index in selectedIndexs {
            self.lanName.append(items[index])
        }
        if self.lanName.count == 0{
            self.lanName = self.items
        }
        //print(self.lanName)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

