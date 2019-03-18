//
//  PresidentTableViewController.swift
//  
//
//  Created by Cristian Aguirre on 10/4/18.
//

import UIKit

class PresidentTableViewController: UITableViewController {

    
    
    
    
    var presObj = [President]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set fixed height for tableview cell.
        self.tableView.rowHeight = 100
        
        
        // Locate the property list and load its content.
        readPropertyList()
        
    }
    
    
    
    func readPropertyList() {
        let path = Bundle.main.path(forResource: "USFounders", ofType: "plist")!
        
        let pressArray:NSArray = NSArray(contentsOfFile:path)! print("\(pressArray)")
        
        
        
        for item in pressArray {
            let dictionary: [String: String] = (item as? Dictionary)!
            let press_number = dictionary["Number"]
            let press_name = dictionary["Name"]
            let press_title = dictionary["Title"]
            let press_years = dictionary["Years"]
            let press_spouce = dictionary["Spouce"]
            let press_party = dictionary["Party"]
            let press_image_cell = dictionary["Image-cell"]
            let press_image = dictionary["Image"]
            
            presObj.append(President(number: press_number!, name: press_name!, title: press_title!, years: press_years!, spouce: press_spouce!, party: press_party!, image_cell: press_image_cell!, image: press_image!))
            
            
        }// ends for loop
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presObj.count
    }
    
    
    
}
