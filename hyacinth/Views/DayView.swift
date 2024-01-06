//
//  DayView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI

struct DayView: View {
    var date: Date
    var tasks: [TaskModel]
    
    var body: some View {
        VStack {
            HStack {
                // Day and Date
                Text(date, formatter: dayFormatter)
                Spacer()
                Text(date, formatter: dateFormatter)
            }
            .padding([.leading, .trailing, .top])
            .fontWeight(.bold)
            .font(.title2)
            
            // Tasks
            ForEach(tasks.filter { isTaskScheduledForDate($0, date: date) }) { task in
                CardView(task: task)
                    .cornerRadius(10)
                    .padding([.leading, .trailing])
            }
        }
        .padding(.bottom)
        
    }
    
    // Day Formatter
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }
    
    // Month and Date Formatter
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }
    
    // Check if Task is Scheduled for Today
    private func isTaskScheduledForDate(_ task: TaskModel, date: Date) -> Bool {
        let taskDay = Calendar.current.startOfDay(for: task.taskDate)
        let viewDay = Calendar.current.startOfDay(for: date)
        return taskDay == viewDay
    }
}

#Preview {
    DayView(date: Date(), tasks: TaskModel.sampleData)
        .background(Color.background)
}
