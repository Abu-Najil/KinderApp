//
//  MyCalendar.swift
//  KinderApp
//
//  Created by Aldin Kolic on 17.07.24.
//

import Foundation

struct MyCalendar {
    private(set) var today = Date()
    private(set) var currentDate: Date
    private(set) var startOfYear: Date
    private var calendar = Calendar(identifier: .iso8601)
    private let dateFormatter = DateFormatter()

    
    init() {
        calendar.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.dateFormat = "yyyyMMdd"

        let todayStr = dateFormatter.string(from: today)
        currentDate = dateFormatter.date(from: todayStr)!
        
        let currentYear = calendar.component(.year, from: currentDate)
        startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1 , day: 1))!
    }
    
    mutating func setCurrentDate(to dateStr: String) {
        let d = dateFormatter.date(from: dateStr)
        if let d {
            currentDate = d
        }
    }
    
    func datesInYear() -> [Date] {
        let range = calendar.range(of: .day, in: .year, for: startOfYear)!
        let datesArrInYear = range.compactMap { Int in
            calendar.date(byAdding: .day ,value: Int - 1 ,to: startOfYear)
        }
        return datesArrInYear 
    }
    
    func datesInAWeek(from date: Date) -> [Date] {
        let range = calendar.range(of: .weekday, in: .weekOfYear, for: date)!
        let datesArrInWeek = range.compactMap{
            calendar.date(byAdding: .day , value: $0 - 1 ,to: date)
        }
        return datesArrInWeek
    }
    
    func startDateOfWeeksInAYear() -> [Date] {
        let currentWeek = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startOfYear)
        let startOfWeek = calendar.date(from: currentWeek)
        let range = calendar.range(of: .weekOfYear, in: .year, for: startOfYear)!
        let startOfWeekArr = range.compactMap{
            calendar.date(bySetting: .weekOfYear, value: $0, of: startOfWeek!)
        }
        return startOfWeekArr
    }
}

extension Date {
    
    /// Gibt mir den Monat und das Jahr voll ausgeschrieben. Beispiel: August 2024
    func monthYYYY() -> String {
        return self.formatted(.dateTime .month(.wide) .year())
    }
    
    /// Gibt mir den Wochentag in Kurzform. Beispiel: Montag = Mo
    func weekDayAbbrev() -> String {
        return self.formatted(.dateTime .weekday(.abbreviated))
    }
    
    /// Gibt mir den tag als Zahl. Beispiel: 12
    func dayNum() -> String {
        return self.formatted(.dateTime .day())
    }
}
