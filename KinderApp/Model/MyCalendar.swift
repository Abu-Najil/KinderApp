//  ViewModel
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
    
    /// Initialisiert ein `MyCalendar`-Objekt mit dem aktuellen Datum und setzt den Kalender auf ISO 8601 mit UTC-Zeitzone.
    /// Das aktuelle Datum und der Jahresbeginn werden formatiert und gesetzt.
    ///
    /// - Beispiel:
    /// ```
    /// let myCalendar = MyCalendar()
    /// ```
    ///
    /// - Parameter: Keine.
    /// - Rückgabewert: Ein neues `MyCalendar`-Objekt.
    init() {
        calendar.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let todayStr = dateFormatter.string(from: today)
        currentDate = dateFormatter.date(from: todayStr)!
        
        let currentYear = calendar.component(.year, from: currentDate)
        startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1 , day: 1))!
    }
    
    /// Setzt das aktuelle Datum auf das angegebene Datum.
    ///
    /// - Parameter date: Ein `Date`-Objekt, das das neue aktuelle Datum darstellt.
    /// - Rückgabewert: Keine.
    /// - Beispiel:
    /// ```
    /// var myCalendar = MyCalendar()
    /// myCalendar.setCurrentDate(to: Date())
    /// ```
    mutating func setCurrentDate(to date: Date) {
        let dateStr = dateFormatter.string(from: date)
        currentDate = dateFormatter.date(from: dateStr)!
    }
    
    /// Gibt ein Array von `Date`-Objekten zurück, das alle Tage im Jahr des Startdatums enthält.
    ///
    /// - Rückgabewert: Ein Array von `Date`-Objekten, das alle Tage im Jahr des Startdatums enthält.
    /// - Beispiel:
    /// ```
    /// let dates = myCalendar.datesInYear()
    /// for date in dates {
    ///     print(date)
    /// }
    /// ```
    func datesInYear() -> [Date] {
        let range = calendar.range(of: .day, in: .year, for: startOfYear)!
        let datesArrInYear = range.compactMap { Int in
            calendar.date(byAdding: .day ,value: Int - 1 ,to: startOfYear)
        }
        return datesArrInYear 
    }
    
    /// Berechnet alle Daten innerhalb derselben Woche, die das gegebene Datum enthält.
    ///
    /// Diese Funktion nimmt ein Startdatum und gibt eine Liste von `Date`-Objekten zurück,
    /// die alle Daten in derselben Woche enthalten wie das angegebene Datum.
    ///
    /// - Parameter date: Ein `Date`-Objekt, das das Startdatum darstellt.
    /// - Returns: Ein Array von `Date`-Objekten, die alle Daten in derselben Woche enthalten.
    ///
    /// Die Woche wird basierend auf dem aktuellen `calendar` berechnet.
    /// Es wird davon ausgegangen, dass der Kalender korrekt initialisiert ist und eine Woche korrekt definiert ist.
    ///
    /// Beispiel:
    /// ```
    /// let calendar = Calendar.current
    /// let today = Date()
    /// let dates = datesInAWeek(from: today)
    /// for date in dates {
    ///     print(date)
    /// }
    /// ```
    ///
    /// - Wichtig: Die Funktion geht davon aus, dass der verwendete Kalender korrekt konfiguriert ist,
    /// und die Funktion wird `fatalError` werfen, wenn der `calendar.range(of:in:for:)`-Aufruf fehlschlägt.
    ///
    func datesInAWeek(from date: Date) -> [Date] {
        let range = calendar.range(of: .weekday, in: .weekOfYear, for: date)!
        let datesArrInWeek = range.compactMap{
            calendar.date(byAdding: .day , value: $0 - 1 ,to: date)
        }
        return datesArrInWeek
    }
    
    /// Gibt ein Array von `Date`-Objekten zurück, das alle Startdaten der Wochen im Jahr des Startdatums enthält.
    ///
    /// - Rückgabewert: Ein Array von `Date`-Objekten, das alle Startdaten der Wochen im Jahr des Startdatums enthält.
    /// - Beispiel:
    /// ```
    /// let startDates = myCalendar.startDateOfWeeksInAYear()
    /// for date in startDates {
    ///     print(date)
    /// }
    /// ```
    func startDateOfWeeksInAYear() -> [Date] {
        let currentWeek = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startOfYear)
        let startOfWeek = calendar.date(from: currentWeek)
        let range = calendar.range(of: .weekOfYear, in: .year, for: startOfYear)!
        let startOfWeekArr = range.compactMap{
            calendar.date(bySetting: .weekOfYear, value: $0, of: startOfWeek!)
        }
        return startOfWeekArr
    }
    
    /// Gibt das Startdatum der Woche zurück, die das gegebene Datum enthält.
    ///
    /// - Parameter date: Ein `Date`-Objekt, das das Startdatum darstellt.
    /// - Returns: Ein `Date`-Objekt, das das Startdatum der Woche enthält.
    /// - Beispiel:
    /// ```
    /// let startOfWeek = myCalendar.startDayOfWeek(from: Date())
    /// print(startOfWeek)
    /// ```
    func startDayOfWeek(from date: Date) -> Date {
        let currentWeek = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return calendar.date(from: currentWeek)!
    }
}



extension Date {
    
    /// Gibt den Monat und das Jahr des Datums als String im Format "Monat YYYY" zurück.
    ///
    /// - Returns: Ein String, der den Monat und das Jahr darstellt.
    /// - Beispiel:
    /// ```
    /// let date = Date()
    /// print(date.monthYYYY())  // "Juli 2024"
    /// ```
    func monthYYYY() -> String {
        return self.formatted(.dateTime .month(.wide) .year())
    }
    
    /// Gibt den Wochentag des Datums als abgekürzten String zurück.
    ///
    /// - Returns: Ein abgekürzter String, der den Wochentag darstellt.
    /// - Beispiel:
    /// ```
    /// let date = Date()
    /// print(date.weekDayAbbrev())  // "Mo"
    /// ```
    func weekDayAbbrev() -> String {
        return self.formatted(.dateTime .weekday(.abbreviated))
    }
    
    /// Gibt den Tag des Datums als Zahl zurück.
    ///
    /// - Returns: Eine Zahl, die den Tag darstellt.
    /// - Beispiel:
    /// ```
    /// let date = Date()
    /// print(date.dayNum())  // "19"
    /// ```
    func dayNum() -> String {
        return self.formatted(.dateTime .day())
    }
    
    func dayMonthYYYY() -> String {
        return self.formatted(.dateTime .day() .month(.wide) .year())
    }
}
