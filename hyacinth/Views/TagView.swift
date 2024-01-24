//
//  TagView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI

struct TagView: View {
    
    @State private var selectedColour = Color.lavendar
    @Binding var task: TaskModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $task.taskTag.tagTitle)
                
                Section {
                    HStack {
                        Button(action: {
                            self.task.taskTag.tagColour = .crimson
                        }) {
   
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.crimson)
                        .cornerRadius(30)
                        Spacer()
                        
                        Button(action: {
                            self.task.taskTag.tagColour = .forest
                        }) {
   
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.forest)
                        .cornerRadius(30)
                        Spacer()
                        
                        Button(action: {
                            self.task.taskTag.tagColour = .perwinkle
                        }) {
   
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.perwinkle)
                        .cornerRadius(30)
                        Spacer()
                        
                        Button(action: {
                            self.task.taskTag.tagColour = .lavendar
                        }) {
   
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.lavendar)
                        .cornerRadius(30)
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "eyedropper")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .frame(width: 40, height: 40)
                                .background(Color.gray)
                                .cornerRadius(30)
                        }
                        
                    }
                    .padding(.vertical, 5)
                }
                .listSectionSpacing(20.0)
            }
            .padding(.vertical, -20)
            .navigationBarTitle("New Tag", displayMode: .inline)
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
    TagView(task: .constant(TaskModel.sampleTask))
}
