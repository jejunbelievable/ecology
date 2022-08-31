//
//  Gallery.swift
//  ecology
//
//  Created by 조성민 on 2022/08/24.
//

import Foundation
import SwiftUI
import UIKit

struct GalleryView: View{
    @State var deleteList = [UIImage]()
    @State private var deleteToggle = false
    @State private var items = [Item]()
    @ObservedObject var viewModel = GalleryViewModel()
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View{
        VStack {
            HStack{
                Text("앨범")
                    .font(.title)
                    .padding()
                Spacer()
                Button {
                    self.deleteToggle.toggle()
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .padding()
                }
            }
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(0..<viewModel.length,id:\.self){ index in
                      if(deleteToggle){
                         Button(action: {
                             if let i = deleteList.firstIndex(of: setItems()[index].image){
                                 deleteList.remove(at: i)
                             }else{
                                 deleteList.append(setItems()[index].image)
                             }
                         }){
                             Image(uiImage:setItems()[index].image)
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width: 30)
                                 .padding()
                          }
                      }else{
                          NavigationLink(destination: ImageDetail(loc:setItems()[index].location,image:setItems()[index].image)){
                              Image(uiImage:setItems()[index].image)
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .cornerRadius(15)
                                  .frame(width: 80, height: 80)
                                  .padding()
                          }
                      }
                    }
                }
            }
            if(deleteToggle){
                Button{
                    for image in deleteList{
                        if let i = viewModel.imageList.firstIndex(of: image){
                            viewModel.imageList.remove(at: i)
                        }
                    }
                    deleteList.removeAll()
                    deleteToggle.toggle()
                } label:{
                    Text("삭제")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.init(red: 26/255, green: 62/255, blue: 0))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }
            Spacer()
        }
        .navigationTitle("현장조사지원앱")
    }
    func loadImages() -> [UIImage] {
        let fm = FileManager.default
        let homeDirURL : URL = fm.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("images")
        var images: [UIImage] = []
        do {
            let directoryContents = try fm.contentsOfDirectory(
                at:homeDirURL,
                includingPropertiesForKeys: nil
            )
            for url in directoryContents{
                guard let image = UIImage(contentsOfFile:url.path) else { return [] }
                images.append(image)
            }
            return images
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
    func loadLocation()->[String]{
        let fm = FileManager.default
        let homeDirURL : URL = fm.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("location")
        var locations : [String] = []
        do {
            if !fm.fileExists(atPath: homeDirURL.path) {
                
                // 폴더가 없으면 하나 만들기
                let nestedFolderURL = homeDirURL
                
                try fm.createDirectory(
                    at: nestedFolderURL,
                    withIntermediateDirectories: false,
                    attributes: nil
                )
            }
            let directoryContents = try fm.contentsOfDirectory(
                at:homeDirURL,
                includingPropertiesForKeys: nil
            )
            for url in directoryContents{
                let location = try String(contentsOfFile:url.path,encoding:.utf8)
                //let myStr = jsonStr.replacingOccurrences(of:"[", with: "").components(separatedBy: "]")
                //print(jsonStr)
                locations.append(location)
            }
            return locations
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
   
    func setItems()->[Item]{
        var items: [Item] = []
        let imageList: [UIImage] = loadImages()
        let locations: [String] = loadLocation()
        for i in 0..<imageList.count{
            let item = Item(image: imageList[i],location:locations[i])
            items.append(item)
        }
        print(items as Any)
        return items
    }
    
    
    struct Item: Identifiable{
        @State var image: UIImage
        @State var location: String
        @State var id = UUID()
    }
}

