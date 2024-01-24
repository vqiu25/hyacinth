//
//  AddView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

struct AddView: View {
    // Variables
    @State private var newTask: TaskModel
    @State private var tab: Int
    @Binding private var tasks: [TaskModel]
    @Binding private var tags: [TagModel]
    @Environment(\.presentationMode) var presentationMode
    
//     Initialiser
    internal init(newTask: TaskModel = TaskModel(title: "", date: Date(), isCompleted: false, tag: TagModel(title: "Reminder", colour: TagColourModel.lavendar)),
                  tab: Int = 0,
                  tasks: Binding<[TaskModel]>,
                  tags: Binding<[TagModel]>) {
        self._newTask = State(initialValue: newTask)
        self._tab = State(initialValue: tab)
        self._tasks = tasks
        self._tags = tags
    }
    
    // Body
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    TextField("Title", text: $newTask.taskTitle)
                    
                    Spacer()
                    
                    Picker("", selection: $tab) {
                        Image(systemName: "checkmark.circle").tag(0)
                        Image(systemName: "calendar.day.timeline.left").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 80)
                }
                // Tag Picker
                NavigationLink(destination: TagListView(tags: self.$tags)) {
                    HStack {
                        Text("Tag")
                        Spacer()
                        Text(newTask.taskTag.tagTitle)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 7)
                            .background(newTask.taskTag.tagColour.colorValue)
                            .cornerRadius(100)
                        
                    }
                }
                
                // Date Picker
                DatePicker("Date", selection: $newTask.taskDate, displayedComponents: .date)
            }
            
            .padding(.vertical, -20)
            .navigationBarTitle("New Item", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                    }
                }
            }
        }
    }
}

// Preview
#Preview {
    AddView(tasks: .constant(TaskModel.sampleData), tags: .constant(TagModel.sampleTags))
}
