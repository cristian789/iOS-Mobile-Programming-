//
//  CustomAnnotation.swift
//  BasicMapView
//
//  Created by Cristian Aguirre on 10/18/18
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class CustomAnnotation: NSObject, MKAnnotation, MKMapViewDelegate {
    
     //initialation of variables here:
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
   // var BuildingCode: String?
    var City: String?
    var State: String?
    var Latitude: String?
    var Longitude: String?
    var BuildingImage: UIImage?
    var Facts: String?
    
    //setup initialization method
//    init (Coordinate: CLLocationCoordinate2D, Title: String, Subtitle: String, City: String,
//          State: String, Image: String, Facts: String){
    init (Coordinate: CLLocationCoordinate2D){
        //again, selfs are for the set up initialation method
        self.coordinate = Coordinate
//        self.title = Title
//        self.subtitle = Subtitle
//
//        self.City = City
//        self.State = State
//        self.BuildingImage = Image
//        self.Facts = Facts
//
    }

}

