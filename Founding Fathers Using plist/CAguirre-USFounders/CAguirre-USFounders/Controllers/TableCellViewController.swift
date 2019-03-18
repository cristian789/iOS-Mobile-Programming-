//
//  TableCellViewController.swift
//  
//
//  Created by Cristian Aguirre on 10/4/18.
//

import UIKit

class TableCellViewController: UITableViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    //First required method – we must indicate the number
    //of columns in the table.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return presObj.count }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let press:President = presObject[indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        // Place cell image, park name and annual visitors in the table cell
        let cellImageName = UIImage(named: park.cellImage)
        cell.cellImageView.image = cellImageName cell.cellTitleLabel.text = park.name cell.cellSubTitleLabel.text = park.visitors return cell
    }
    
    
}
