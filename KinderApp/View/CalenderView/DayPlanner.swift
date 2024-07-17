//
//  DayPlanner.swift
//  KinderApp
//
//  Created by Aldin Kolic on 17.07.24.
//

import Foundation


class DayPlanner: ObservableObject {
    
    @Published private var model = MyCalendar()
    
    var currentDate: Date {
        return model.currentDate
    }
    
    func setCurrentDate(to dateStr: String) {
        model.setCurrentDate(to: dateStr)
    }
    
    func dates() -> [Date] {
        model.datesInYear()
    }
    
    func startDateOfWeeksInAYear() -> [Date] {
        model.startDateOfWeeksInAYear()
    }
    
    func datesInAWeek(from date: Date) -> [Date] {
        model.datesInAWeek(from: date)
    }
}
