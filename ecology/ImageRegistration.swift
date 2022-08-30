//
//  ImageRegistration.swift
//  ecology
//
//  Created by 조성민 on 2022/08/25.
//

import Foundation
import SwiftUI
import MapKit

struct ImageTmp: Identifiable, Hashable{
    var id = UUID()
    var image : String
    var isChecked : Bool
}

struct ImageRegistration: View{
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @State var inputList = [ImageTmp]()
    @State var imageList = [ImageTmp(image: "1", isChecked: false), ImageTmp(image: "2", isChecked: false), ImageTmp(image: "3", isChecked: false), ImageTmp(image: "4", isChecked: false)]
    
    var body: some View{
        VStack{
            Text("앨범")
                .font(.title)
                .padding()
            
            //이미지 선택시 빨간색 테두리 생성
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(imageList, id: \.self){image in
                        Button{
                            if let i = inputList.firstIndex(of: image){
                                inputList.remove(at: i)
                                if let j = imageList.firstIndex(of: image){
                                    imageList[j].isChecked.toggle()
                                }
                            }else{
                                inputList.append(image)
                                if let j = imageList.firstIndex(of: image){
                                    imageList[j].isChecked.toggle()
                                }
                            }
                        }label: {
                            Color(red: .random(in: 0...1), green: .random(in: 0...1), blue:
                                    .random(in: 0...1))
                                    .cornerRadius(15)
                                    .frame(width: 130, height:130)
                                    
                        }
                        .overlay(image.isChecked ? RoundedRectangle(cornerRadius: 15).stroke(Color.red,lineWidth: 5) : nil)
                    }
                }
            }
            Button{
            }label: {
                Text("사진 및 데이터 등록")
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 70, alignment: .center)
                    .background(Color.init(red: 26/255, green: 62/255, blue: 0))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        }
    }
}

struct ImageRegistration_Previews: PreviewProvider{
    static var previews: some View{
        ImageRegistration().previewDevice("iPhone 11").previewInterfaceOrientation(.portrait)
    }
}
