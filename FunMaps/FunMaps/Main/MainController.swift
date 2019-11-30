//
//  MainController.swift
//  FunMaps
//
//  Created by Eugene Berezin on 11/30/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit
import LBTATools

extension MainController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "id")
        annotationView.canShowCallout = true
        annotationView.image = #imageLiteral(resourceName: "tourist")
        return annotationView
    }
}



class MainController: UIViewController {
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.fillSuperview()

        setupRegionForMap()
        
        setupAnnotationsForMap()
        
    }
    
    fileprivate func setupAnnotationsForMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.769795, longitude: -122.414490)
        annotation.title = "San Francisco!"
        annotation.subtitle = "CA"
        mapView.addAnnotation(annotation)
        
        let appleCampusAnnotation = MKPointAnnotation()
        appleCampusAnnotation.coordinate = .init(latitude: 37.3326, longitude: -122.030024)
        appleCampusAnnotation.title = "Apple Campus! Dream Job"
        appleCampusAnnotation.subtitle = "Cupertiono CA"
        mapView.addAnnotation(appleCampusAnnotation)
        
        mapView.showAnnotations(self.mapView.annotations, animated: true)
        
    }
    
    fileprivate func setupRegionForMap() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.769795, longitude: -122.414490)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}



//SwiftUI Preview

struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
    struct ContentView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContentView>) -> MainController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainController, context: UIViewControllerRepresentableContext<MainPreview.ContentView>) {
            
        }
        
        
        typealias UIViewControllerType = MainController
        
        
    }
}

