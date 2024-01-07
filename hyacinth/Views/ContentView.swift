//
//  ContentView.swift
//  checklist
//
//  Created by Victor Esther Qiu on 3/12/23.
//



import SwiftUI

struct ContentView: View {
    @State var tasks: [TaskModel] // Assuming you have task data
    @State var currentDate: Date = Date()
    @State private var draggedTask: TaskModel?
    @ScaledMetric var customBubbleSize: CGFloat = 55
    @ScaledMetric var customButtonSize: CGFloat = 30
    
    private var weekDates: [Date] {
        calculateWeekDates(from: currentDate)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) { // Combine the top bar and the ScrollView into a single VStack
                
                // Top Bar
                HStack {
                    // Menu or Icon button on the left
                    Button(action: {
                        // Action for the menu or icon button
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: customButtonSize, height: customButtonSize)
                                .foregroundColor(Color.default)
                            Image(systemName: "gearshape.circle.fill")
                                .foregroundColor(Color.lavendar)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        }
                    }

                    

                    // Display the current month
                    Text(currentDate, formatter: monthFormatter)
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    // Button to go to the previous week
                    Button(action: {
                        currentDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: currentDate) ?? currentDate
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: customButtonSize, height: customButtonSize)
                                .foregroundColor(Color.default)
                            Image(systemName: "arrow.backward.circle.fill")
                                .foregroundColor(Color.lavendar)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        }
                    }

                    // Button to go to the next week
                    Button(action: {
                        currentDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: currentDate) ?? currentDate
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: customButtonSize, height: customButtonSize)
                                .foregroundColor(Color.default)
                            Image(systemName: "arrow.forward.circle.fill")
                                .foregroundColor(Color.lavendar)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        }
                    }
                }
                .padding(.bottom, 10)
                .padding(.top, 2)
                .padding([.leading, .trailing])

                Divider()
                    .background(Color.reverseDefault)

                // ScrollView for the content
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(weekDates, id: \.self) { date in
                            DayView(date: date, tasks: tasksForDate(date))
                        }
                    }
                }
            }
            .background(Color.background)
            
            VStack {
                Spacer()
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .frame(width: customBubbleSize, height: customBubbleSize)
                            .foregroundColor(Color.default)
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: customBubbleSize))
                            .fontWeight(.bold)
                        .foregroundColor(Color.lavendar)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }
        
    }

    private func calculateWeekDates(from date: Date) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Sunday = 1, Monday = 2, etc.
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
        return (0..<7).map { calendar.date(byAdding: .day, value: $0, to: startOfWeek)! }
    }

    private func tasksForDate(_ date: Date) -> [TaskModel] {
        // Filter your tasks based on the date
        tasks.filter { isTaskScheduledForDate($0, date: date) }
    }

    private func isTaskScheduledForDate(_ task: TaskModel, date: Date) -> Bool {
        let taskDay = Calendar.current.startOfDay(for: task.taskDate)
        let viewDay = Calendar.current.startOfDay(for: date)
        return taskDay == viewDay
    }
    
    // Helper DateFormatter to extract the month
        private var monthFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM Y" // Month format
            return formatter
        }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tasks: TaskModel.sampleData)
    }
}
