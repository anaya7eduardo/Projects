//
//  ViewController.swift
//  ExampleMap
//
//  Created by Eduardo Anaya on 12/15/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    /*
     You use instances of this class to configure, start, and stop the Core Location services. A location manager object supports the following location-related activities:
     Tracking large or small changes in the user’s current location with a configurable degree of accuracy.
     Reporting heading changes from the onboard compass.
     Monitoring distinct regions of interest and generating location-based events when the user enters or leaves those regions.
     Reporting the range to nearby beacons
     */
    private let locationManager = CLLocationManager()
    private let userRadiusInMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkAuthStatus()
    }

    /*
     In your simulator you can simulate location by selecting the simulator and from the top menu select Debug -> Simulate Location
     ATL Lat: 33.749, Long: -84.3880
     LOND Lat: 51.5072, Long: 0.1276
     */
    /*
     Core Location Framework: Coore Location provides services that determine a device's geographic location, altitude, and orientation, or its position relative to a nearby iBeacon device. The framework gathers data using all available components on the device, including the Wi-Fi, GPS, Bluetooth, magnometer, barometer and cellular hardware
     https://developer.apple.com/documentation/corelocation
     What's new in Location WWDC '20
     https://developer.apple.com/videos/play/wwdc2020/10660
     */
    
    private func setupLocationServices() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkAuthStatus() {
        switch locationManager.authorizationStatus {
        case .restricted, .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            //Like the delegate we can also set this to true in Interface Builder
            mapView.showsUserLocation = true
        case .authorizedAlways:
            mapView.showsUserLocation = true
            grokUserLocation()
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            grokUserLocation()
        @unknown default:
            break
        }
        
    }
    
    private func grokUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func locationServicesCheck() {
        //is Geolocation even enabled on device?
        if CLLocationManager.locationServicesEnabled() {
            //if yes lets setup our location manager and services
            setupLocationServices()
            checkAuthStatus()
        } else {
            print("OK, Fine Then...")
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    //Grabs an array of locations in order to build a history of coordinates. From this we can then determine heading/direction/orientation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.longitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //Check Auth Status
        checkAuthStatus()
    }
}
