//
//  mapViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 18/01/18.
//  Copyright © 2018 agile-m-32. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet var mkMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mkMapView.mapType = MKMapType.standard
        
        mkMapView.delegate = self
        
        // 2)
        let location = CLLocationCoordinate2D(latitude: 23.0225,longitude: 72.5714)
        
        let location2 = CLLocationCoordinate2D(latitude: 22.3072,longitude: 73.1812)
        
        // 3) 1 = 111 km approx
        let span = MKCoordinateSpanMake(0.05, 0.05)//0.05 = 5 km  0.5 = 50km
        let region = MKCoordinateRegion(center: location, span: span)
        mkMapView.setRegion(region, animated: true)
        
        // 4)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "My Space"
        annotation.subtitle = "Ahmedabad"
        mkMapView.addAnnotation(annotation)
        
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Star Bazar"
        annotation2.subtitle = "Baroda"
        mkMapView.addAnnotation(annotation2)
        
        
        
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        
        
        if ((error) != nil)
        {
            print(error)
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        //annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        let btn = UIButton(type: .detailDisclosure)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        annotationView?.rightCalloutAccessoryView = btn
        
        
        annotationView?.canShowCallout = true
        annotationView?.image = UIImage(named: "pinMapD")
        
        
        return annotationView
    }
    
    @objc func btnClick(_ sender:UIButton)
    {
        print("Button Click....")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
