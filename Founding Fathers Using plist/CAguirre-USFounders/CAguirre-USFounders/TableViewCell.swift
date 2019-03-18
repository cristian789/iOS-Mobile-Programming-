//
//  TableViewCell.swift
//  CAguirre-USFounders
//
//  Created by Cristian Aguirre on 10/4/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    //iboutlets views
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    
    //function awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //function for set selected (boolenians)
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
