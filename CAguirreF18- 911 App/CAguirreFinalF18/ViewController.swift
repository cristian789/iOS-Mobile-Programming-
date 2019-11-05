//
//  ViewController.swift
//  CAguirreFinalF18
//
//  Created by Cristian Aguirre Alvizo on 12/6/18.
//  Copyright © 2018 Cristian Aguirre Alvizo. All rights reserved.
//

import UIKit
import MapKit
import MessageUI

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var dtvLatitude: UILabel!
    @IBOutlet weak var dtvLongitude: UILabel!
    
    
    var latitude = ""      //string initiallizers to contain the user's latest location
    var longitude = ""
    
    
    //action button for share location
    @IBAction func shareLocation(_ sender: Any) {
        
        //if no mail services then print error
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        else
        {
            //standard initializer for composing an email
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            
            //recipients
            let toRecipients = ["niucsci@gmail.com"]+["akdjnjkns@gmail.com"]+["skdjbfjkasbf@gmail.com"]
            
            //email title
            let emailTitle = "Final calling for help!"
            
            //body of email
            let messageBody = "Please send help as soon as possible to: Latitude of \(latitude) and Longitude of \(longitude)"
            
            //setting up the email to the VC
            mailComposeVC.setToRecipients(toRecipients)
            mailComposeVC.setSubject(emailTitle)
            mailComposeVC.setMessageBody(messageBody, isHTML: false)
            self.present(mailComposeVC, animated: true, completion: nil)
            
        }
    }
    
    //function to go back (dismiss) to the view after cancelled emailed or sent
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func phoneNum1(_ sender: Any) {
        //get phone# from button title
         let phoneNum = "911"      //phone number 1
        
        //create as url string w/ require protocol
        
        //  "tel ://"
        
        let myURL:NSURL = URL(string: "tel://\(phoneNum)")! as NSURL
        
        //make a call
        
        UIApplication.shared .open(myURL as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        //UIApplication.shared open(myURL as URL, option:[:], CompletitionHandler: nil)
    }
    
    @IBAction func phoneNum2(_ sender: Any) {
        //get phone# from button title
         let phoneNum = "912"       //phone number 2
        
        //create as url string w/ require protocol
        
        //  "tel ://"
        
        let myURL:NSURL = URL(string: "tel://\(phoneNum)")! as NSURL
        
        //make a call
        
        UIApplication.shared .open(myURL as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        //UIApplication.shared open(myURL as URL, option:[:], CompletitionHandler: nil)
    }
    
    
    let locationMgr = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.mapView.showsUserLocation = true
        
        locationMgr.delegate = self     //setting the location mangaer to self
        
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        
        locationMgr.requestWhenInUseAuthorization()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get the new location
        let newLocation = locations[0]
        
        // Prepare to display it on the map.
        let span:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion.init(center: currentLocation, span: span)
        
        mapView.setRegion(region, animated: false)
        
//        // Display the location on the map
//        self.mapView.showsUserLocation = true
        
        //these two lines send the information to the labels to be displayed
        self.dtvLatitude.text = String(newLocation.coordinate.latitude)
        self.dtvLongitude.text = String(newLocation.coordinate.longitude)
        
        //these two lines send information
        self.latitude = String(newLocation.coordinate.latitude)
        self.longitude = String(newLocation.coordinate.longitude)
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

}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
