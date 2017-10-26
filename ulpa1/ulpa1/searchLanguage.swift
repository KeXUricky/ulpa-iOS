

//
//  NetWorkingService.swift
//  ulpa1
//
//  Created by Ke XU on 2017/9/28.
//  Copyright © 2017年 Unimelb. All rights reserved.
// control the first interface of Search By Language 
import UIKit

class searchLanguage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items:[String] = []
    var lanuguage = [Language]()
    
    
    var selectedIndexs = [Int]()
    var langlist = [String]()

    
    
    @IBOutlet weak var tableView: UITableView!

    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var templist = [String]()
        // get the avaliable languages
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
        let controller = segue.destination as! ChooseStudyType
        controller.langlist = self.langlist
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
            selectedIndexs.remove(at: index) 
        }else{
            selectedIndexs.append(indexPath.row) 
        }
        ////refresh after editing
        self.tableView?.reloadRows(at: [indexPath], with: .automatic)
    }
    

    @IBAction func btnClick(_ sender: AnyObject) {
         langlist.removeAll()
        for index in selectedIndexs {
            langlist.append(items[index])
        }
        // show an alert if users did not select at least one language
        if langlist.count == 0{
            let myAlert = UIAlertController(title: "You must select at least one language!",
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
