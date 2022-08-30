//
//  ImageDetailGps.swift
//  ecology
//
//  Created by Jejun Kang on 2022/08/26.
//
import SwiftUI
import MapKit
class ImageDetailGps: NSObject, ObservableObject {
    let location : String = ImageDetailGpsView.location
    @State static var region: MKCoordinateRegion = MKCoordinateRegion()
    override init(){
        ImageDetailGps.region = ImageDetailGps.setRegion(location:location)
    }
    static func getLatitude(location: String)->Double{
        do{
            let jsonData = location.data(using:.utf8)
            let jsonObj = try JSONSerialization.jsonObject(with:jsonData!,options:.allowFragments) as?Dictionary<String,Any>
            let latitude : Double = (String(describing: jsonObj?["latitude"]) as NSString).doubleValue
            return latitude
        }catch let error{
            print(error)
        }
        return 37
    }
    static func getLongitude(location: String)->Double{
        do{
            let jsonData = location.data(using:.utf8)
            let jsonObj = try JSONSerialization.jsonObject(with:jsonData!,options:.allowFragments) as? Dictionary<String,Any>
            let longitude: Double = (String(describing: jsonObj?["longitude"]) as NSString).doubleValue
            return longitude
        }catch let error{
            print(error)
        }
        return 127
    }
    static func getAltitude(location: String)->Double{
        do{
            let jsonData = location.data(using:.utf8)
            let jsonObj = try JSONSerialization.jsonObject(with:jsonData!,options:.allowFragments) as?Dictionary<String,Any>
            let altitude : Double = (String(describing:jsonObj?["altitude"]) as NSString).doubleValue
            return altitude
        }catch let error{
            print(error)
        }
        return 0
    }
    static func setMarker(lat: Double, lon:Double)->[Place]{
        return [Place(lat: lat, long: lon)]
    }
    static func setRegion(location: String)->MKCoordinateRegion{
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: getLatitude(location:location), longitude: getLongitude(location:location)), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        return region
    }
    
}



