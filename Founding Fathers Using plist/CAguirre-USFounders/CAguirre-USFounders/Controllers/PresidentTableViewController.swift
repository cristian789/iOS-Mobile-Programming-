//
//  PresidentTableViewController.swift
//  
//
//  Created by Cristian Aguirre on 10/4/18.
//

import UIKit

class PresidentTableViewController: UITableViewController {
    //initiallizes an array of objects to hold the president objects
    var presObj = [President]()
    
    //As the main view loads, let the row height to fix number,
    //add an info button to navigate to the "about App" view,
    //then locate, load and display the contain from the
    //property list.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set fixed height for tableview cell.
        self.tableView.rowHeight = 100
        
        //add info light button to navigate to the About app view((((magic stuff)))
        addRightNavigationBarInfoButton()
        
        // Locate the property list and load its content.
        readPropertyList()
        
    }
    
    func addRightNavigationBarInfoButton(){
        
        //create an Info Light button
        let button = UIButton(type: .infoDark)
        button.addTarget(self, action: #selector(self.showAboutAppView), for: .touchUpInside)
        
        
        //place the button at the top right corner of the Navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        
    }
    //function object to show about app witb code instead of being connnected from the main
    @objc func showAboutAppView() {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutAppNavigationController") as! UINavigationController
        self.present(controller, animated: true, completion:nil)
    }
    
    
    
    /*  This function finds the property list and load the root array that contains dictionaries.  It then extracts elements in each dictionary into an array of object of Park class that I defined in the Park.swift file.
     */
    func readPropertyList() {
        let path = Bundle.main.path(forResource: "USFounders", ofType: "plist")!
        
        let pressArray:NSArray = NSArray(contentsOfFile:path)!
        print("\(pressArray)")
        
        
        
        for item in pressArray {
            //item is of type of any object and it cannot be used
            //as a subscripts dicctionary with value-key pair.
            //therefore, i need to convert item into a dictionary.
            let dictionary: [String: Any] = (item as? Dictionary)!
           
            //next, use dictionary to extract each attribute
            //in the dictionary before apending them in the
            //parkObject.
            
            let press_number = dictionary["Number"]
            let press_name = dictionary["Name"]
            let press_title = dictionary["Title"]
            let press_years = dictionary["Years"]
            let press_spouce = dictionary["Spouce"]
            let press_party = dictionary["Party"]
            let press_image_cell = dictionary["Image-cell"]
            let press_image = dictionary["Image"]
            
            presObj.append(President(number: press_number as! String, name: press_name as! String, title:  press_title as! String, years: press_years as! String, spouce: press_spouce as! String, party: press_party as! String, image_cell: press_image_cell as! String, image: press_image as! String))
            
            
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
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let press:President = presObj[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
        cell.cellImageView.image = UIImage(named:press.image_cell)
        cell.nameCell.text = press.name
        cell.titleCell.text = press.years
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //FIRST identify the detail view controler as the destination  view controller
        if (segue.identifier == "DETAILVIEW"){
            let destVC = segue.destination as! DetailViewController
            
            //prepare to send park image, name, and title
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let pres:President = presObj[indexPath.row]
                destVC.navigationItem.title = pres.name
                destVC.tvPressImage = pres.image
                destVC.tvTitle = pres.title
                destVC.tvSpouce = pres.spouce
                destVC.tvParty = pres.party
                destVC.tvYears = pres.years
                
               // destVC.tvPressImage = press.image
                
            }
            
            
            // prepare to send park image, park name, state and entrance fees
            
        }
        
    }
        
}
