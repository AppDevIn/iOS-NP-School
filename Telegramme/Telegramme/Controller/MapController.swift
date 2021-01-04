//
//  File.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 3/1/21.
//

import Foundation
import UIKit
import MapKit
import CoreLocation


class MapController : UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        print("Map view loaded")
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489") { (p, e) in
            self.render(p![0].location!, "Ngee Ann Polytechnic", "Schoo of ICT", false)
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("Service enabled")
            
            
            locationManager.startUpdatingLocation()
            
        } else {
            print("Error")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            print("locations = \(location.coordinate.latitude) \(location.coordinate.longitude)")
            
            render(location, "Me", nil, true)
        }
        
        
        
    }
    
    func render(_ location:CLLocation, _ title:String, _ subtitle:String?, _ zoomIn:Bool){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        if zoomIn{
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            
            let region = MKCoordinateRegion(center: coordinate, span: span)
            
            mapView.setRegion(region, animated: true)
        }
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = title
        
        if let st = subtitle {
            annotation.subtitle = st
        }
        
        self.mapView.addAnnotation(annotation)
        
    }
}

