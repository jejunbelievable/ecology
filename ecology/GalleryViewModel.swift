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
    @Published var imageList: [UIImage]
    @Published var locations: [String]
    @Published var items: [Gallery.Item]
    @Published var length: Int
    init(){
        model = Gallery()
        imageList = model.imageList
        locations = model.locations
        items = model.items
        length = model.items.count
    }
}
