//
//  TaskModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

struct TaskModel: Identifiable {
    let id: UUID
    private var title: String
    private var date: Date
    private var isCompleted: Bool
    private var tag: TagModel
    
    internal init(id: UUID = UUID(), title: String, date: Date, isCompleted: Bool, tag: TagModel) {
        self.id = id
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
        self.tag = tag
    }
    
    // Getters and Setters
    internal var taskTitle: String {
        get { self.title }
        set { self.title = newValue }
    }
    
    internal var taskDate: Date {
        get { self.date }
        set { self.date = newValue }
    }
    
    internal var taskIsCompleted: Bool {
        get { self.isCompleted }
        set { self.isCompleted = newValue }
    }
    
    internal var taskTag: TagModel {
        get { self.tag }
        set { self.tag = newValue }
    }
}
