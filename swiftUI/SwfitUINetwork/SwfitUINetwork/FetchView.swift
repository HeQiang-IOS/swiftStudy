//
//  FetchView.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

import Foundation

import Combine


struct FetchView: View {
    var todo: Todo
    
    var body: some View {
        HStack {
            if todo.completed {
                Image(systemName: "checkmark.square")
            } else {
                Image(systemName: "square")
            }
            
            Text(todo.title)
        }
    }
}

struct FetchView_Previews: PreviewProvider {
    static var previews: some View {
        FetchView(todo: Todo(userID: 0, id: 0, title: "Make cell", completed: true))
    }
}




