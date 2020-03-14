//
//  UpdateList.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/17.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI


struct UpdateList: View {
    var updates = updateData
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
    }
    func move(from source: IndexSet, to destination: Int) {
        
        store.updates.swapAt(source.first!, destination == store.updates.count ? store.updates.count - 1 : destination)
        
//        let temp = source.first!
//        store.updates.remove(at: source.in)
        print(source, destination)
        
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.updates){
                    item in
                    NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                        HStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80.0, height: 80.0)
                                .background(Color("background"))
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.text)
                                    .lineLimit(2)
                                    .frame(height: 50.0)
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 8.0)
                }
                .onMove(perform: move)
                .onDelete { (index) in
                    self.store.updates.remove(at: index.first!)
                }
            }
            .navigationBarTitle(Text("Update"))
            .navigationBarItems(leading:
                Button(action: addUpdate) {
//                    Text("Add Update")
                    Image(systemName: "plus")
                },
                                trailing:
               EditButton()
            )
        }
        .onAppear{
            self.store.updates = updateData
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList().environment(\.colorScheme, .dark)
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}



let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Learn now to build custom views and controls in swiftUI with advanced composition.", date: "JUN 26"),
    
    Update(image: "Illustration2", title: "Framer X", text: "Learn now to build custom views and controls in swiftUI with advanced composition.", date: "JUN 8"),
    
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn now to build custom views and controls in swiftUI with advanced composition.", date: "JUN 20"),
    
    
    Update(image: "Illustration4", title: "React Native Part 2", text: "Learn now to build custom views and controls in swiftUI with advanced composition.", date: "JUN 29"),
    
    
    Update(image: "Illustration1", title: "SwiftUI", text: "Learn now to build custom views and controls in swiftUI with advanced composition.", date: "JUN 6"),
    
    Update(image: "Illustration1", title: "Unity", text: "Learn now to build custom views and controls in swiftUI with advanced composition.", date: "JUN 2")
]



