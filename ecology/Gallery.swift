//
//  GalleryController.swift
//  ecology
//
//  Created by Jejun Kang on 2022/08/25.
//
import SwiftUI

class Gallery: NSObject, ObservableObject {
    var imageList: [UIImage] = []
    var locations: [String] = []
    var items: [Item] = []
    override init(){
        super.init()
        imageList = loadImages()
        locations = loadLocation()
        items = setItems()
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
                let jsonStr = try String(contentsOfFile:url.path,encoding:.utf8)
                let myStr = jsonStr.components(separatedBy: .newlines)
                print(myStr)
                locations.append(jsonStr)
            }
            return locations
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
    func setItems()->[Gallery.Item]{
        var items: [Item] = []
        let imageList: [UIImage] = loadImages()
        let locations: [String] = loadLocation()
        for i in stride(from:0, to:imageList.count,by:1){
            let item = Item(image: imageList[i],location:locations[i])
            items.append(item)
        }
        return items
    }
    struct Item: Identifiable, Hashable{
        var id = UUID()
        let image: UIImage
        let location: String
        var isChecked = false
    }
}
