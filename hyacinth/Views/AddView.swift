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
    
    // Initialiser
    internal init(tab: Int = 0, tasks: Binding<[TaskModel]>, tags: Binding<[TagModel]>) {
        self._tab = State(initialValue: tab)
        self._tasks = tasks
        self._tags = tags
        
        // Initialise newTask with the first tag from tags array
        if let firstTag = tags.wrappedValue.first {
            self._newTask = State(initialValue: TaskModel(title: "", date: Date(), isCompleted: false, tag: firstTag))
        } else {
            // Provide a default initialization if tags array is empty
            self._newTask = State(initialValue: TaskModel(title: "", date: Date(), isCompleted: false, tag: TagModel(title: "Reminder", colour: TagColourModel.lavendar)))
        }
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
                NavigationLink(destination: TagListView(task: self.$newTask, tags: self.$tags)) {
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
            
            .padding(.vertical, -15)
            .navigationBarTitle("New Item", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        tasks.append(newTask)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(newTask.taskTitle.isEmpty)
                }
            }
        }
    }
}

// Preview
#Preview {
    AddView(tasks: .constant(TaskModel.sampleData), tags: .constant(TagModel.sampleTags))
}
