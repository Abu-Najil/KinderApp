//
//  DayPlanner.swift
//  KinderApp
//
//  Created by Aldin Kolic on 17.07.24.
//

import Foundation


class DayPlanner: ObservableObject {
    
    //Task Model
    @Published private var taskModel = MyPlanner()
    @Published var taskDescription: String = ""
    
    var tasks: [Task] {
        return taskModel.tasks
    }
    
    func createTask(){
        taskModel.createTask(taskDescription)
    }
    
    // calendar Model
    @Published private var calModel = MyCalendar()
    
    var currentDate: Date {
        return calModel.currentDate
    }
    
    func setCurrentDate(to date: Date) {
        calModel.setCurrentDate(to: date)
    }
    
    func dates() -> [Date] {
        calModel.datesInYear()
    }
    
    func startDateOfWeeksInAYear() -> [Date] {
        calModel.startDateOfWeeksInAYear()
    }
    
    func datesInAWeek(from date: Date) -> [Date] {
        calModel.datesInAWeek(from: date)
    }
    
    func startDateOfWeek(from date: Date) -> Date {
        calModel.startDayOfWeek(from: date)
    }
    
    func isCurrent(_ date: Date) -> Bool {
        return date == currentDate
    }
    
    func currentPositionInWeek() -> Int {
        let startOfWeek = startDateOfWeek(from: currentDate)
        let datesInAWeek = datesInAWeek(from: startOfWeek)
        let position = datesInAWeek.firstIndex(of: currentDate)!
        return position
    }
}
