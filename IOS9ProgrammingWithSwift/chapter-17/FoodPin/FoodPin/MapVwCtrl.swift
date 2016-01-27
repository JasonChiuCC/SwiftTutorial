//
//  MapVwCtrl.swift
//  FoodPin
//
//  Created by dah.com on 2016/1/27.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit
import MapKit

class MapVwCtrl: UIViewController{

    @IBOutlet weak var mapView: MKMapView!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        // 建立物件
        let geoCoder = CLGeocoder()
        
        /* 
          傳進地址，之後會轉為經緯度位置存進 placemarks 陣列
          placemarks 陣列可能有多項，越精準的地址就越少 placemarks 物件
        */
        geoCoder.geocodeAddressString(restaurant.location,completionHandler:{ placemarks , error in
            // 如果轉換失敗就 return
            if error != nil {
                print(error)
                return
            }
            
            // 將陣列中的第一個經緯度物件取出（第一個是最精準的）
            if let placemarks = placemarks {
                
                let placemark       = placemarks[0]
                
                // 建立地圖的標註物件
                let annotation      = MKPointAnnotation()
                annotation.title    = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                // 將標注物件顯示在地圖上
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })//結束轉換
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MapVwCtrl:MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        // Pin color customization
        annotationView?.pinTintColor = UIColor.orangeColor()
        
        return annotationView
    }
}

