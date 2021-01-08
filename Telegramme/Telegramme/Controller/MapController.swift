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
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    
    let locationManager: CLLocationManager = {
        $0.requestWhenInUseAuthorization()
        $0.desiredAccuracy = kCLLocationAccuracyBest
        $0.startUpdatingLocation()
        $0.startUpdatingHeading()
        return $0
    }(CLLocationManager())
    
    override func viewDidLoad() {
        print("Map view loaded")
        
        locationManager.delegate = locationDelegate
        locationManager.requestWhenInUseAuthorization()
        
        
        locationDelegate.locationCallback = { location in
            self.latestLocation = location
            let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
            let long = String(format: "Long: %3.8f", location.coordinate.longitude)
            print("\(lat), \(long)")
            
            self.latestLocation = location
            self.render(location, "Me", nil, true)
            
            
        }
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489") { (p, e) in
            self.render(p![0].location!, "Ngee Ann Polytechnic", "Schoo of ICT", false)
        }
        
    }
    
    func render(_ location:CLLocation, _ title:String, _ subtitle:String?, _ zoomIn:Bool){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        if zoomIn{
            zoomInLocation(location)
        }
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = title
        
        if let st = subtitle {
            annotation.subtitle = st
        }
        
        self.mapView.addAnnotation(annotation)
        
    }
    
    func zoomInLocation(_ location:CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func clkMe(_ sender: Any) {
        if let location = self.latestLocation {
            self.zoomInLocation(location)
        }
            
    }
    
    @IBAction func clkMap(_ sender: Any) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489") { (p, e) in
            self.zoomInLocation(p![0].location!)
        }
    }
}

