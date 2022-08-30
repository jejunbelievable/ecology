//
//  GalleryViewModel.swift
//  ecology
//
//  Created by Jejun Kang on 2022/08/25.
//
import SwiftUI
import AVFoundation
import Combine
class GalleryViewModel: ObservableObject {
    private let model: Gallery
    var imageList: [UIImage]
    var locations: [String]
    var items: [Gallery.Item]
    var length: Int
    init(){
        model = Gallery()
        imageList = model.imageList
        locations = model.locations
        items = model.items
        length = model.items.count
    }
}
