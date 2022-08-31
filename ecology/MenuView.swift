//
//  MenuView.swift
//  ecology
//
//  Created by 조성민 on 2022/08/29.
//

import Foundation
import SwiftUI

struct MenuView: View{
    @Binding var showMenu : Bool
    
    var body: some View{
        VStack(alignment: .leading){
            Text("현장조사지원앱")
                .font(.title2)
                .padding()
            Button{
                withAnimation{
                    self.showMenu = false
                }
            } label: {
                HStack{
                    Image("document")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                        .padding([.leading, .bottom], 10.0)
                    Text("홈으로")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .padding()
                }
            }
            
            NavigationLink(destination: ContentView()){
                HStack{
                    Image("document")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                        .padding([.leading, .bottom], 10.0)
                    Text("사용안내")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .padding()
                }
            }
            
            NavigationLink(destination: RegistrationStatus(showMenu: self.$showMenu)){
                HStack{
                    Image("document")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                        .padding([.leading, .bottom], 10.0)
                    Text("등록현황")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .padding()
                }
            }
            
            NavigationLink(destination: GpsRouteView(showMenu: self.$showMenu)){
                HStack{
                    Image("document")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                        .padding([.leading, .bottom], 10.0)
                    Text("GPS 경로보기")
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .padding()
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
