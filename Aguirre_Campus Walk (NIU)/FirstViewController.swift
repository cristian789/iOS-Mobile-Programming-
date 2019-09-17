//
//  FirstViewController.swift
//  Campus Walk
//
//  Created by Cristian Aguirre on 11/22/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//building structs of oop
struct BuildingArea: Decodable {
    let NIUPartialCampus: [Building]?
    
    private enum CodingKeys: String, CodingKey {
        case NIUPartialCampus = "NIU Partial Campus"
    }
}


//in this struct we keep all of our information with decodable, these have to be exact to the way
//they are on the json
struct Building: Decodable {
    let Number: String?
    let BuildingName: String?
    let BuildingCode: String?
    let City: String?
    let State: String?
    let Latitude: String?
    let Longitude: String?
    let BuildingImage: String?
    let Facts: String?
}

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    //map view oulets
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapTypeControl: UISegmentedControl!
    @IBAction func mapTypeControl(_ sender: UISegmentedControl) {
        let segIndex = sender.selectedSegmentIndex
        switch segIndex{    //switch statements for when preessed on the satellite, standard and hybrid
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
    }
    //    var Latitude: String?
//    var Longitude: String?
//
    let locationMgr = CLLocationManager()
    


    override func viewDidLoad() {
        
        // let mapRegion = MKCoordinateRegionMakeWithDistance(myLocCoordinate, 500, 500)
         //this indicate how close you want to zoom using distance.
        
        super.viewDidLoad()
        
        
        readJson()
        //mapView.setRegion(mapRegion, animated: true)
        
        self.mapView.showsUserLocation = true
        
        locationMgr.delegate = self   //setting the location mangaer to self
        
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        
        locationMgr.requestWhenInUseAuthorization()
        
     //   locationMgr.startUpdatingLocation()
        
        
    }
    
    
    func readJson(){
        //main url
        let jsonUrlString = "http://faculty.cs.niu.edu/~krush/f18/niucampus-json" //url
        
        let url = URL(string: jsonUrlString)
        
        
        URLSession.shared.dataTask(with: (url!)) {(data, response, err) in
        
            //incase we get an error go to the description
            guard err == nil else {
                print (err.debugDescription)
                return
                }
            guard let data = data else {return}
            
            
        do{
            let result = try JSONDecoder().decode([BuildingArea].self, from: data)
            print(result)
            
            let area = result[0].NIUPartialCampus
            
            for build in area! {
                let Latitude = Double(build.Latitude ?? "0")
                let Longitude = Double(build.Longitude ?? "0")
                //printing out each building by their numbers 
                if build.Number == "14" || build.Number == "12" || build.Number == "10" ||
                    build.Number == "13" || build.Number == "2" || build.Number == "22" ||
                    build.Number == "23" || build.Number == "28" || build.Number == "17" ||
                    build.Number == "16"{
                
                let myLocCoordinate = CLLocationCoordinate2D(latitude: Latitude!, longitude: Longitude!)
                
//                    let annotationPin = CustomAnnotation(Coordinate: myLocCoordinate, Title: build.BuildingName!, Subtitle: build.BuildingCode! , City: build.City!, State: build.State!, Image: build.BuildingImage!, Facts: build.Facts!)
                    let annotationPin = CustomAnnotation(Coordinate: myLocCoordinate)
                    annotationPin.title = build.BuildingName
                    annotationPin.subtitle = build.BuildingCode
                    annotationPin.Facts = build.Facts
                    
                    //casting url into uiimage
                    let imaURL = NSURL(string: build.BuildingImage!)
                    if imaURL != nil{
                        let data = NSData(contentsOf: (imaURL as URL?)!)
                        annotationPin.BuildingImage = UIImage(data: data! as Data)
                    }
                    
                    self.mapView.addAnnotation(annotationPin)
                    
                }
                
            }//dispaches the queue into the main
            DispatchQueue.main.async {
            }
        }
            //print error incase of bad data or no data
        catch let jsonErr {
                print ("bad data", jsonErr)
                }
     }.resume()


   }


func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    // Get the new location
    let newLocation = locations[0]
    
    // Prepare to display it on the map.
    let span:MKCoordinateSpan = MKCoordinateSpanMake(0.02, 0.02)
    let currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude)
    let region:MKCoordinateRegion = MKCoordinateRegionMake(currentLocation, span)
    
    mapView.setRegion(region, animated: false)
    
    // Display the location on the map
    self.mapView.showsUserLocation = true

}

    func locationManager( _ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        switch  status {
        case .denied, .restricted:
            print("no authorization")
        case .notDetermined:
            locationMgr.requestWhenInUseAuthorization()
        default: // Good to go
            locationMgr.startUpdatingLocation()
        }
    }
    
//this funcation creates our callout method foor the = info button on annotations
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        let identifier = "CustomAnnotation"
        
        // 2
        if annotation is CustomAnnotation {
            // 3
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                //4
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                // 5
//                let btn = UIButton(type: .detailDisclosure)
//                annotationView!.rightCalloutAccessoryView = btn
                
                
            } else {
                // 6
                annotationView!.annotation = annotation
            }
            
            //making a var of a uiview to prepare pictures for constrains
            var x = UIView()
            
            //to be able to call pictures from the custom annotation
            let buildingAnnotation = annotation as! CustomAnnotation
            
            //sending which ever annotation - picture has been pressed for constrains
            x = UIImageView(image: buildingAnnotation.BuildingImage)
            let heightConstraint = NSLayoutConstraint(item: x, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 275)
            x.addConstraint(heightConstraint)
            
            let widthConstraint = NSLayoutConstraint(item: x, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 275)
            x.addConstraint(widthConstraint)
            
            //here it sends the picture to detailcalloutview already with constrains on it
            annotationView?.detailCalloutAccessoryView = x
            
            
            //making a right call out acesory button
            let btn = UIButton(type: .detailDisclosure)
            annotationView!.rightCalloutAccessoryView = btn
            
            return annotationView
        }
        
        // 7
        return nil
    }
    
    //this gives us the notification when pressed on the info button
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let capital = view.annotation as! CustomAnnotation
        let placeName = capital.title
        let placeInfo = capital.Facts
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
    
    
    
    
    //to start updating our location
    override func viewDidAppear(_ animated: Bool) {
        locationMgr.startUpdatingLocation()
    }
    //to stop updation our location 
//    override func viewDidDisappear(_ animated: Bool) {
//        locationMgr.stopUpdatingLocation()
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}





