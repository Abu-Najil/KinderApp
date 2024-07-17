//
//  TestCalender.swift
//  KinderApp
//
//  Created by Aldin Kolic on 17.07.24.
//

import SwiftUI

struct TestCalender: View {
    
    @StateObject var dayPlanner = DayPlanner()
    
    var body: some View {
        VStack{
            HStack{
                Text(dayPlanner.currentDate.monthYYYY())
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Spacer()
                Group{
                    Image(systemName: "calendar")
                    Image(systemName: "tray.fill")
                    Image(systemName: "gear")
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()

            SwipeableStack(dayPlanner.startDateOfWeeksInAYear()) { date in
                WeekView(of: date)
            }
            
            Spacer()
        }
        .environmentObject(dayPlanner)
    }
}

struct SwipeableStack<WhateverTypeOfData: Hashable , Content>: View where Content: View {
    var whateverData: [WhateverTypeOfData] = []
    let content: (WhateverTypeOfData) -> Content
                       
    init(_ data:[WhateverTypeOfData], @ViewBuilder content: @escaping (WhateverTypeOfData) -> Content) {
        self.whateverData = data
        self.content = content
    }
    
    @State private var dataIndex = 0
    @State private var dragged = CGSize.zero
    
    var previousExist: Bool {
        return (dataIndex - 1) >= 0
    }
    
    var nextExist: Bool {
        return dataIndex < whateverData.count - 1
    }
    
    var body: some View {
        GeometryReader { geo in
            let frameWidth = geo.size.width
            HStack(spacing: 0) {
                
                if previousExist {
                    content(whateverData[dataIndex - 1])
                        .frame(width: frameWidth)
                        .offset(x: previousExist ? -frameWidth : 0)
                }
                content(whateverData[dataIndex])
                    .frame(width: frameWidth)
                    .offset(x: previousExist ? -frameWidth : 0)
                
                if nextExist {
                    content(whateverData[dataIndex + 1])
                        .frame(width: frameWidth)
                        .offset(x: previousExist ? -frameWidth : 0)
                }
            }
            .offset(x: dragged.width)
            .gesture(DragGesture()
                .onChanged { value in
                    dragged.width = value.translation.width
                }
                .onEnded { value in
                    var indexOffset = 0
                    withAnimation(.easeInOut(duration: 0.3)) {
                        dragged = CGSize.zero
                        if value.predictedEndTranslation.width < -frameWidth / 2 && nextExist  {
                            dragged.width = -frameWidth
                            indexOffset = 1
                        }
                        if value.predictedEndTranslation.width > frameWidth / 2 && previousExist{
                            dragged.width = frameWidth
                            indexOffset = -1
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        dataIndex += indexOffset
                        dragged = CGSize.zero
                    }
                }
            )
        }
    }
}

struct WeekView: View {
    @EnvironmentObject var dayplaner: DayPlanner
    let date: Date
    let week = ["Mo","Di","Mi","Do","Fr","Sa","So",]
    
    init(of date: Date) {
        self.date = date
    }
    
    var body: some View {
        let datesInAWeek = dayplaner.datesInAWeek(from: date)
        HStack{
            Spacer()
            ForEach(datesInAWeek.indices, id: \.self){ i in
                let d = datesInAWeek[i]
                VStack{
                    Text(week[i])
                    Text(d.dayNum())
                }
                Spacer()
            }
        }
    }
}




#Preview {
    TestCalender()
}
