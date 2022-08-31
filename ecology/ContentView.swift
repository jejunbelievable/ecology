//
//  ContentView.swift
//  ecology
//
//  Created by 조성민 on 2022/08/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var showMenu = false
    
    let coloredNavAppearance = UINavigationBarAppearance()
    let barButtonItemAppearance = UIBarButtonItem.appearance()

    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(red: 26/255, green: 62/255, blue: 0, alpha: 1.0)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        barButtonItemAppearance.tintColor = UIColor.white
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        let drag = DragGesture()
                    .onEnded {
                        if $0.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    }
        
        return NavigationView{
            GeometryReader{ geometry in
                ZStack(alignment: .leading){
                    MainView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width*3/4 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu{
                        MenuView(showMenu: self.$showMenu)
                            .frame(width: geometry.size.width*3/4)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationTitle("국립생태원 현장조사지원앱")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        withAnimation{
                            self.showMenu.toggle()
                        }
                    }label: {
                        Image(systemName: "list.triangle")
                            .imageScale(.large)
                            .foregroundColor(Color.white)
                    }
                }
            }
        }
    }
}

struct MainView: View{
    
    @State private var gpsToggle = true
    
    var body: some View{
        VStack{
            Toggle("GPS 경로표시", isOn: $gpsToggle).font(.title).foregroundColor(Color.white)
                .padding()
            NavigationLink(destination: CameraView()){
                Image("camera_bt_foreground")
                    .resizable()
                    .scaledToFit()
            }
            NavigationLink(destination: Registration()){
                Image("photo_register_foreground")
                    .resizable()
                    .scaledToFit()
            }
            NavigationLink(destination: GalleryView()){ Image("gallery_bt_foreground")
                    .resizable()
                    .scaledToFit()
            }
        }
        .background(Image("main_background_foreground").resizable()
            .ignoresSafeArea()
            .frame(width: 1000, height: 1100)
        )
        .font(.title)
    }
}

struct Place: Identifiable{
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID=UUID(), lat: Double, long: Double){
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long
        )
    }
}

