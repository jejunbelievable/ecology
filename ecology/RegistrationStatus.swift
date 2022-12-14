//
//  RegistrationStatus.swift
//  ecology
//
//  Created by 조성민 on 2022/08/26.
//

import Foundation
import SwiftUI
import MapKit

struct RegistrationStatus: View{
    @State private var isClicked  = false
    @Binding var showMenu : Bool
    
    var body: some View{
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack{
                Text("등록현황")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 150)
                    .foregroundColor(Color.white)
                    .overlay(VStack{
                        Text("사진 및 데이터 등록현황")
                            .font(.title3)
                        HStack{
                            Spacer()
                            Text("0건 준비중")
                                .font(.title3)
                                .padding()
                            Text("2건 등록완료")
                                .font(.title3)
                                .padding()
                            Spacer()
                        }
                    })
                    .padding()
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 150)
                    .foregroundColor(Color.white)
                    .overlay(VStack{
                        Text("최근등록사례")
                            .font(.title3)
                        HStack(alignment: .center){
                            Rectangle()
                                .frame(width: 100, height: 70)
                                .foregroundColor(Color.cyan)
                            Rectangle()
                                .frame(width: 100, height: 70)
                                .foregroundColor(Color.cyan)
                            Rectangle()
                                .frame(width: 100, height: 70)
                                .foregroundColor(Color.cyan)
                        }
                    })
                    .padding()
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 150)
                    .foregroundColor(Color.white)
                    .overlay(VStack{
                        Text("현재위치")
                            .font(.title3)
                        Button{
                            self.isClicked = true
                        }label: {
                            Text("내 위치 확인하기")
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .frame(width: 300, height: 50, alignment: .center)
                                .background(Color.init(red: 0, green: 100/255, blue: 70/255))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Text("내 위치는 Latitude : 37.1234")
                            .font(.body)
                        Text("Longitude : 126.12332")
                            .font(.body)
                        
                    })
                    .padding()
            }
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
