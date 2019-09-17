//
//  BuildingDetailsViewController.swift
//  Campus Walk
//
//  Created by Cristian Aguirre on 11/28/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

import UIKit

class BuildingDetailsViewController: UIViewController {

    //iboulets for the buildings
    @IBOutlet weak var dtvbuilidngImage: UIImageView!
    
    @IBOutlet weak var dtvName: UILabel!
    @IBOutlet weak var dtvCode: UILabel!
    @IBOutlet weak var dtvCity: UILabel!
    @IBOutlet weak var dtvState: UILabel!
    @IBOutlet weak var dtvFacts: UILabel!
    
    //variables to hold the data of the building being pressed
    var tvBuildImage: String!
    var tvName, tvCode, tvCity, tvState, tvFacts: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //making our string of uiimage url to give us the image
        let imaURL = NSURL (string: tvBuildImage)
        if imaURL != nil{
            let data = NSData(contentsOf: (imaURL as URL?)!)
            dtvbuilidngImage.image = UIImage(data: data! as Data)
        }

        //transferring our information into our labels
        dtvName.text = tvName
        dtvCode.text = tvCode
        dtvCity.text = tvCity
        dtvState.text = tvState
        dtvFacts.text = tvFacts
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
