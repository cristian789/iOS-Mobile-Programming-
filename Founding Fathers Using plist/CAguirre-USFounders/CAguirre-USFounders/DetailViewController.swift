//
//  DetailViewController.swift
//  
//
//  Created by Cristian Aguirre on 10/4/18.
//this view contrains the iboulets of for the detail view were  all the information aboout the
//presidents is being projected

import UIKit

class DetailViewController: UIViewController {

     //iboutlets for the uiimage and for the uilabel
    @IBOutlet weak var pressImageView: UIImageView!
    @IBOutlet weak var pressTitleLabel: UILabel!
    @IBOutlet weak var pressYearsLabel: UILabel!
    @IBOutlet weak var pressSpouceLabel: UILabel!
    @IBOutlet weak var pressPartyLabel: UILabel!
    
    //varibles to hold data passed from the tableview
    var tvPressImage: String!
    var tvTitle: String!
    var tvYears: String!
    var tvSpouce: String!
    var tvParty: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //place sent data into their outlets
        pressImageView.image = UIImage(named: tvPressImage)
        pressTitleLabel.text = tvTitle
        pressYearsLabel.text = tvYears
        pressSpouceLabel.text = tvSpouce
        pressPartyLabel.text = tvParty
    } 

}
