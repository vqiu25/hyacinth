//
//  DayView.swift
//  hyacinth
//
//  Created by Victor Esther Qiu on 6/01/24.
//

import SwiftUI

struct DayView: View {
    var date: Date
    
    var body: some View {
        VStack {
            HStack {
                // Day and Date
                Text(date, formatter: dayFormatter)
                Spacer()
                Text(date, formatter: dateFormatter)
            }
            .padding(.top, 10)
            .fontWeight(.bold)
            .font(.title2)
        }
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
    DayView(date: Date())
        .background(Color.background)
}
