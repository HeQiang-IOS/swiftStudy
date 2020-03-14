//
//  ContentView.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    //    var todes: Todos
    @ObservedObject var viewModel: TodoViewModel = TodoViewModel()
    
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(ImageModel.imageURLArray) {
                    model in
                    ImageRow(model: model)
                }
                
                ForEach(self.viewModel.todos){
                    todo in
                     FetchView(todo: todo)
                }
            }
            
            
//            List(self.viewModel.todos     ){ todo in
//                FetchView(todo: todo)
//            }
                
            .navigationBarTitle(Text("11"))
            .navigationBarItems(leading:
                Button(action: {
                    self.viewModel.shuffle()
                }, label: {
                    Text("Shuffle")
                }),
                                trailing:
                Button(action: {
                    self.viewModel.load()
                }, label: {
                    Image(systemName: "arrow.2.circlepath")
                })
            )
        }
        .onAppear{
            self.viewModel.load()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
