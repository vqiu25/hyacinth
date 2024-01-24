//
//  EditTaskView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

struct EditTaskView: View {
    // Variables
    @State private var tab: Int
    @Binding private var task: TaskModel
    @Environment(\.presentationMode) private var presentationMode
    
    // Initialisers
    internal init(tab: Int = 0, task: Binding<TaskModel>) {
        self._tab = State(initialValue: tab)
        self._task = task
    }
    
    // Body
    var body: some View {
        NavigationView {
            Form {
                // Edit Task Name Field
                HStack {
                    TextField("Title", text: $task.taskTitle)
                    
                    Spacer()
                    
                    Picker("", selection: $tab) {
                        Image(systemName: "checkmark.circle").tag(0)
                        Image(systemName: "calendar.day.timeline.left").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 80)
                }
                
                // Tag Picker
                HStack {
                    Text("Tag")
                    Spacer()
                    Text(task.taskTag.tagTitle)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 7)
                        .background(task.taskTag.tagColour.colorValue)
                        .cornerRadius(100)
                    
                }
                
                // Date Picker
                DatePicker("Date", selection: $task.taskDate, displayedComponents: .date)
            }
            .padding(.vertical, -20)
            .navigationBarTitle("Edit Task", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .tint(.lavendar)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                    
                    }
                    .tint(.lavendar)
                }
            }
        }
    }
}

// Preview
#Preview {
    EditTaskView(task: .constant(TaskModel.sampleTask))
}
