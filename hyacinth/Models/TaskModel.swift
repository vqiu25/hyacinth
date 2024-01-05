//
//  TaskModel.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

internal struct TaskModel: Identifiable {
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

// Mock Data
extension TaskModel {
    static let sampleTask: TaskModel = TaskModel(title: "Complete Assignment", date: Date(), isCompleted: false, tag: TagModel(title: "Work", colour: TagColour.crimson))
    
    static let sampleData: [TaskModel] = [
        TaskModel(title: "Complete Assignment", date: Date(), isCompleted: false, tag: TagModel(title: "Work", colour: TagColour.crimson)),
        TaskModel(title: "Complete Test", date: Date(), isCompleted: false, tag: TagModel(title: "Work", colour: TagColour.crimson)),
        TaskModel(title: "Grocery Shopping", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, isCompleted: false, tag: TagModel(title: "Personal", colour: TagColour.perwinkle)),
        TaskModel(title: "Team Meeting", date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, isCompleted: false, tag: TagModel(title: "Work", colour: TagColour.forest))
    ]
}
