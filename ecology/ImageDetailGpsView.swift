//
//  ImageDetailGps.swift
//  ecology
//
//  Created by 조성민 on 2022/08/24.
//

import Foundation
import SwiftUI
import MapKit
import Combine

struct ImageDetailGpsView: View{
    let columns = [GridItem(.flexible())]
    @State static var location: String = ""
    @Binding var loc : String
    var body: some View{
        
        VStack{
            Map(coordinateRegion: ImageDetailGps.$region, showsUserLocation: true, annotationItems: [Place(lat: ImageDetailGps.getLatitude(location:self.loc), long: ImageDetailGps.getLongitude(location:self.loc))]){marker in
                MapMarker(coordinate: marker.location, tint: Color.red)
            }.edgesIgnoringSafeArea(.all)
            
            
            LazyVGrid(columns: columns){
                ForEach((0...7), id: \.self){ _ in
                    HStack{
                        Spacer()
                        Text("aaaa")
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 30, alignment: .center)
                            .background(Color.init(red: 26/255, green: 62/255, blue: 0))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        Spacer()
                        Text("aaaa")
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("현장조사지원앱")
    }
    
    
}

