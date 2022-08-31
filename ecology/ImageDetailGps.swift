//
//  ImageDetailGps.swift
//  ecology
//
//  Created by Jejun Kang on 2022/08/26.
//
import SwiftUI
import MapKit
class ImageDetailGps: NSObject, ObservableObject {
    static func getLatitude(location: String)->Double{
        do{
            let jsonData = location.data(using:.utf8)
            let jsonObj = try JSONSerialization.jsonObject(with:jsonData!,options:.allowFragments) as?Dictionary<String,Any>
            //let latitude : Double = (String(describing: jsonObj?["latitude"]) as NSString).doubleValue
            let latitude : Double = jsonObj!["latitude"] as! Double
            print(latitude)
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
            //let longitude: Double = (String(describing: jsonObj?["longitude"]) as NSString).doubleValue
            let longitude : Double = jsonObj!["longitude"] as! Double
            print(longitude)
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
            //let altitude : Double = (String(describing:jsonObj?["altitude"]) as NSString).doubleValue
            let altitude : Double = jsonObj!["altitude"] as! Double
            print(altitude)
            return altitude
        }catch let error{
            print(error)
        }
        return 0
    }
    static func setMarker(lat: Double, lon:Double)->[Place]{
        return [Place(lat: lat, long: lon)]
    }
    
    
}



