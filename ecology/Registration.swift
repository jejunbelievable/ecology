//
//  Registration.swift
//  ecology
//
//  Created by 조성민 on 2022/08/25.
//

import Foundation
import SwiftUI
import MapKit

struct Registration: View{
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    let leftColumn = ["조사원", "분야", "첨부파일", "도엽", "유역", "평가단위", "위치정보", "특이사항"]
    
    @State private var alertVisible = false
    @State private var remark = ""
    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View{
        VStack{
            Text("사진에 해당하는 정보들을 입력하여 등록합니다.")
                .font(.body)
                .padding()
            LazyVGrid(columns: columns){
                ForEach((0...7), id: \.self){ i in
                    Text(leftColumn[i])
                        .font(.body)
                        .padding(3)
                    if(i==2){
                        NavigationLink(destination: ImageRegistration()){
                            Image("photo_register_foreground")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 130, alignment: .top)
                                .padding()
                        }
                    }else if(i==7){
                        ZStack(alignment: .topLeading){
                            let placeholder = "특이사항을 적어주세요."
                            
                            TextEditor(text: $remark)
                                .font(.body)
                                .lineSpacing(10)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                                .frame(width: 170.0, height: 120.0)
                                .padding(.all)
                            
                            if(remark.isEmpty){
                                Text(placeholder)
                                    .font(.body)
                                    .foregroundColor(Color.white)
                                    .lineSpacing(10)
                                    .padding([.top, .leading], 25)
                            }
                        }
                    }else{
                        Text("aaa")
                            .font(.body)
                            .padding(3)
                    }
                }
            }
            Button {
                self.alertVisible = true
            } label: {
                Text("등록")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.init(red: 26/255, green: 62/255, blue: 0))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .alert("아래의 정보와 함께 사진을 전송하시겠습니까?",isPresented: $alertVisible){
                Button("확인", role: .cancel){}
                Button("취소", role: .destructive){}
            }message: {
                Text("\n\(leftColumn[0]) : aaaa\n\(leftColumn[1]) : bbbb\n\(leftColumn[2]) : cccc\n\(leftColumn[3]) : dddd\n\(leftColumn[4]) : eeee\n")
                    .font(.body)
            }
        }
        .navigationTitle("현장조사지원앱")
    }
}

struct Registration_Previews: PreviewProvider{
    static var previews: some View{
        Registration().previewDevice("iPhone 11").previewInterfaceOrientation(.portrait)
    }
}
