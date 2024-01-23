//
//  AddView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 5/01/24.
//

import SwiftUI

struct AddView: View {
    
    var date: Date
    @Binding var task: TaskModel
    @Binding var tasks: [TaskModel]
    @State private var tab = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
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
            .navigationBarTitle("New Item", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .tint(.lavendar)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        // Add your edit action here
                    }
                    .tint(.lavendar)
                }
            }
        }
    }
}

#Preview {
    AddView(date: Date(), task: .constant(TaskModel.sampleTask), tasks: .constant(TaskModel.sampleData))
}
