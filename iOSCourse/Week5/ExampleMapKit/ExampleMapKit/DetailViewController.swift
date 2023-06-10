//
//  DetailViewController.swift
//  ExampleMapKit
//
//  Created by Eduardo Anaya on 12/15/21.
//

import UIKit
import MapKit
import CoreLocation

class DetailViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var userDetailImageView: UIImageView!
    @IBOutlet weak var userDetailFullNameLabel: UILabel!
    @IBOutlet weak var userDetailEmailLabel: UILabel!
    @IBOutlet weak var userDetailLocationLabel: UILabel!
    var users: User?
    private let locationManager = CLLocationManager()
    private let userRadiusInMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkAuthStatus()
        loadCoords()
        setupDetail()
    }
    
    func setupDetail() {
        userDetailImageView.getImage(from: (users?.picture.large)!)
        userDetailFullNameLabel.text = (users?.name.title)! + ". " + (users?.name.first)! + " " + (users?.name.last)!
        userDetailEmailLabel.text = (users?.email)!
        userDetailLocationLabel.text = "Coords: " + (users?.location.coords.latitude)! + ", " + (users?.location.coords.longitude)!
//        print((users?.name)!)
//        print((users?.email)!)
//        print((users?.location.coords)!)
    }
    
    func loadCoords() {
        let lat = Double((users?.location.coords.latitude)!)
        let lon = Double((users?.location.coords.longitude)!)
        
        let initialLocation = CLLocation(latitude: lat!, longitude: lon!)
        mapView.centerLocation(initialLocation, regionRadius: userRadiusInMeters)
        
        let userCenter = CLLocation(latitude: lat!, longitude: lon!)
        let userRegion = MKCoordinateRegion(center: userCenter.coordinate, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: userRegion), animated: true)
            
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: (userRadiusInMeters * 20))
        mapView.setCameraZoomRange(zoomRange, animated: true)

        let artwork = Artwork(
          locationName: (users?.name.title)! + ". " + (users?.name.first)! + " " + (users?.name.last)!,
         coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: lon!))
        mapView.addAnnotation(artwork)
    }
    
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
        if CLLocationManager.locationServicesEnabled() {
            setupLocationServices()
            checkAuthStatus()
        } else {
            print("OK, Fine Then...")
        }
    }

}

extension DetailViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        //let lat = Double((users?.location.coords.latitude)!)
        //let lon = Double((users?.location.coords.longitude)!)
        let center = CLLocationCoordinate2D(latitude: location.coordinate.longitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthStatus()
    }
}

private extension MKMapView {
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
