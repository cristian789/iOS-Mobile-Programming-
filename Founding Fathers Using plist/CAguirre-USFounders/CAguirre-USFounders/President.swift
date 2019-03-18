//
//  President.swift
//  CAguirre-USFounders
//
//  Created by Cristian Aguirre on 10/4/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.


//Creating a custom class that maps to all the keys (i.e.
//attributes) of the object from the property list.

import UIKit
import Foundation

class President: NSObject {
    
    //creating custom classes that maps all the keys
    var number: String!
    var name: String!
    var title: String!
    var years: String!
    var spouce: String!
    var party: String!
    var image_cell: String!
    var image: String!
    
    //set up intialization method
    init(number: String, name: String, title: String, years: String,
         spouce: String, party: String, image_cell: String,
         image: String )   {
        
                        self.number = number
                        self.name = name
                        self.title = title
                        self.years = years
                        self.spouce = spouce
                        self.party = party
                        self.image_cell = image_cell
                        self.image = image
        
                        }
    

}

