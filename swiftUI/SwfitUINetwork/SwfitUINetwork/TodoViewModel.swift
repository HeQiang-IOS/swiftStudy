//
//  TodoViewModel.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/12.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

import Foundation

import Combine

public class TodoViewModel: ObservableObject {
   @Published var todos: Todos = [Todo]()
    
    func shuffle() {
        self.todos = self.todos.shuffled()
    }
    
    func load(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            do {
                guard let data = data else {return}
                let todoss = try JSONDecoder().decode(Todos.self, from: data)
                DispatchQueue.main.async {
                    self.todos = todoss
                }
                
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}
