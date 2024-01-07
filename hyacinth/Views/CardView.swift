//
//  CardView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI
import SwipeActions

internal struct CardView: View {
    @State var task: TaskModel
    
    internal var body: some View {
        
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                // Task Name and Tag Name
                Text(task.taskTitle)
                    .font(.body)
                    .fontWeight(.semibold)
                Text(task.taskTag.tagTitle)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 7)
                    .foregroundColor(.white)
                    .background(Color(task.taskTag.tagColour.colorValue))
                    .cornerRadius(100)
            }
            
            Spacer()
            
            // Task Completion Button
            Button(action: {
                task.taskIsCompleted.toggle()
            }) {
                Image(systemName: task.taskIsCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.lavendar)
            }
        }
        .padding(.all, 10)
        .background(Color.card)
        
    }
    
}

#Preview {
    CardView(task: TaskModel.sampleTask)
}
