//
//  Home.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/13.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

let statusBarHeight = UIApplication.shared.windows[0].windowScene?.statusBarManager?.statusBarFrame.height ?? 0



let screen = UIScreen.main.bounds

struct Home: View {
    
    @State var show = false
    @State var showProfile = false
    
    
    var body: some View {
        
        
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.interactiveSpring())
            
            
            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.interactiveSpring())
                .offset(y: showProfile ? statusBarHeight + 40 : screen.height)
            
            MenuButton(show: $show).offset(x: -40, y: showProfile ? statusBarHeight : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile).offset(x: -16, y: showProfile ? statusBarHeight : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background"))
               .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        //        Home().environment(\.colorScheme, .dark)
        //            .environment(\.sizeCategory, .extraSmall)
        Group {
            Home().previewDevice("iPhone SE")
            Home().previewDevice("iPhone Xʀ")
            Home().previewDevice("iPad Pro (9.7-inch)")
        }
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .frame(width: 32.0, height: 32.0)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
            
            
            Text(text)
                .foregroundColor(.primary)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Settings", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menuItems = menuData
    @Binding var show: Bool
    @State var showUpdate = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20.0) {
                ForEach(menuItems) {
                    item in
                    if item.title == "Settings" {
                        Button(action: { self.showUpdate.toggle() }) {
                            MenuRow(image: item.icon, text: item.title)
                        }.sheet(isPresented: self.$showUpdate){
                            Settings()
                        }
                    } else {
                    MenuRow(image: item.icon, text: item.title)
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth:360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0.0, y: 10.0, z: 0.0))
                
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundColor(.primary)
        }
        .frame(width: 44.0, height: 44.0)
        .background(Color("button"))
        .cornerRadius(30)
            
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                VStack {
                    Button(action: { self.show.toggle() }) {
                        HStack {
                            Spacer()
                            Image(systemName: "list.dash").foregroundColor(.primary)
                        }
                        .padding(.trailing, 20)
                        .frame(width: 90.0, height: 60.0)
                        .background(Color("button"))
                        .cornerRadius(30)
                            
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    @State var showUpdate = false
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.show.toggle()
//                        if self.show {
//                            UITabBar.appearance().isHidden = true
//                        }
                        
                    }) {
                        CircleButton(icon: "person.crop.circle")
                    }
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        CircleButton(icon: "bell")
                    }.sheet(isPresented: $showUpdate){
                        UpdateList()
                    }
                    
                }
                Spacer()
            }
            Spacer()
        }
    }
}
