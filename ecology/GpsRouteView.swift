//
//  GpsRouteView.swift
//  ecology
//
//  Created by 조성민 on 2022/08/31.
//

import Foundation
import SwiftUI
import MapKit

struct GpsRouteView: View{
    @Binding var showMenu : Bool
    
    var body: some View{
        VStack{
            Text("GPS 경로 보기")
            HStack{
                Button{
                } label: {
                    Text("현재 경로추가")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50, alignment: .center)
                        .background(Color.init(red: 26/255, green: 62/255, blue: 0))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button{
                }label: {
                    Text("경로 기록 확인")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50, alignment: .center)
                        .background(Color.init(red: 26/255, green: 62/255, blue: 0))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            Text("* 30분 단위로 자동적으로 경로가 추가됩니다. *")
                .foregroundColor(Color.red)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                }
                
            }
            .frame(width: 380, height: 500)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    self.showMenu = false
                }label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                    Text("Back")
                        .foregroundColor(Color.white)
                }
            }
        }
        .navigationTitle("현장조사지원앱")
    }
    
}
