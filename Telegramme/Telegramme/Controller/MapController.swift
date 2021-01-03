//
//  File.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 3/1/21.
//

import Foundation
import UIKit
import MapKit


class MapController : UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        print("Map view loaded")
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489") { (p, e) in
            let lat = String(
                    format: "Lat: %3.12f", p![0].location!.coordinate.latitude)
                let long = String(
                    format: "Long: %3.12f", p![0].location!.coordinate.longitude)

                print("\(lat), \(long)")
            
            //Set the location needed to be annoated
            let location = p![0].location!.coordinate
            
            //Zoom into that location
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            self.mapView.setRegion(region, animated: true)
            
            // Set the annoate
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location
            annotation.title = "Ngee Ann Polytechnic"
            annotation.subtitle = "Schoo of ICT"
            self.mapView.addAnnotation(annotation)

        }
        
 
        
    }
}
