//
//  TodoModel.swift
//  SwfitUINetwork
//
//  Created by 何强 on 2019/12/12.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

import Foundation

import Combine


public class Todo: Codable, Identifiable {
    public let userID: Int
    public let id: Int
    public let title: String
    public let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    
    init(userID: Int, id: Int, title: String, completed: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
    }
}


public typealias Todos = [Todo]
