//
//  ImageDetail.swift
//  ecology
//
//  Created by 조성민 on 2022/08/24.
//

import Foundation
import SwiftUI
import MapKit

struct ImageDetail: View{
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    @Binding var loc: String
    @Binding var image: UIImage
    var body: some View{
        
        VStack{
            VStack{
                ZStack{
                    Text("해당 사진")
                        .font(.largeTitle)
                        .padding()
                    HStack{
                        Spacer()
                        NavigationLink(destination: ImageDetailGpsView(loc:$loc)){
                            Image("gps")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .padding()
                        }
                    }
                }
                Image(uiImage:image)
                    .resizable()
                    .padding()
                    .frame(width: 300, height: 300)
            }
            VStack{
                Text("메타데이터")
                    .font(.title)
                    .padding()
                
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach((0...4), id: \.self){ _ in
                            Text("aaaa")
                                .font(.system(size: 30))
                            Text("bbbb")
                                .font(.system(size: 30))
                        }
                    }
                }
            }
        }
        .navigationTitle("현장조사지원앱")
    }
}
