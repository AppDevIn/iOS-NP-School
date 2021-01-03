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
        
        //Set the location needed to be annoated
        let location = CLLocationCoordinate2D(latitude: 1.332064,
                                              longitude: 103.7743581)
        
        //Zoom into that location
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        // Set the annoate 
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Ngee Ann Polytechnic"
        annotation.subtitle = "Schoo of ICT"
        mapView.addAnnotation(annotation)
        
    }
}
