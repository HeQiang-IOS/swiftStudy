//
//  HomeList.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/17.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var courses = coursesData
    @State var showCouseContent = false
    var body: some View {
        
        ScrollView {
            VStack {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Course")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }.padding(.leading, 70)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30.0) {
                        ForEach(courses) { item in
                            Button(action: {
                                self.showCouseContent.toggle()
                            }) {
                                
                                GeometryReader { geometry in
                                    CourseView(
                                        title: item.title,
                                        image: item.image,
                                        color: item.color,
                                        shadowColor:item.shadowColor
                                    )
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -40), axis: (x: 0, y: 10.0, z: 0))
                                    
                                }
                                .frame(width: 246, height: 360.0)
//                                UIModalPresentationStyle
                                
                            }.sheet(isPresented: self.$showCouseContent) {
                                ContentView()
                            }
                        }
                    }
                    .padding(.leading, 40.0)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                
                
                CertificateRow().padding(.bottom, 100.0)
            }
            .padding(.top, 78.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(20)
                .lineLimit(4)
                //                .frame(width: 200.0)
                .padding(.trailing, 40)
            
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246.0, height: 200.0)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246.0, height: 360.0)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
    
}

let coursesData = [
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Design Course",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    ),
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Design Course",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    ),
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Design Course",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    )
]
