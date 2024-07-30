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
        
        let mondayOfTheCurrentDate = dayPlanner.startDateOfWeek(from: dayPlanner.currentDate)
        
        ZStack(alignment: .bottomTrailing) {
            VStack{
                HStack{
                    Text(mondayOfTheCurrentDate.monthYYYY())
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Spacer()
                    Group{
                        Image(systemName: "calendar")
                        Image(systemName: "tray.fill")
                        Image(systemName: "gear")
                    }
                    .padding(4)
                    
                }
                .padding()
                
                SwipeableStack(dayPlanner.startDateOfWeeksInAYear(), jumpTo: mondayOfTheCurrentDate) { (date, pos) in
                    WeekView(of: date, viewPosition: pos)
                }
                .frame(maxHeight: 60)
                
                SwipeableStack([1, 2, 3], jumpTo: 2) { (_, _) in
                    DayView()
                }
            }
            
            CreateButton()
        }
        .environmentObject(dayPlanner)
    }
}


struct SwipeableStack<WhateverTypeOfData: Hashable , Content>: View where Content: View {
    
    var whateverData: [WhateverTypeOfData] = []
    let content: (WhateverTypeOfData, ViewPosition) -> Content
    var jumpTo: WhateverTypeOfData?
    
    init(_ data:[WhateverTypeOfData] , jumpTo: WhateverTypeOfData? = nil, @ViewBuilder content: @escaping (WhateverTypeOfData, ViewPosition) -> Content) {
        self.whateverData = data
        self.content = content
        if let jumpTo {
            self.jumpTo = jumpTo
        }
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
                    content(whateverData[dataIndex - 1], .previousView)
                        .frame(width: frameWidth)
                        .offset(x: previousExist ? -frameWidth : 0)
                }
                content(whateverData[dataIndex], .centerView)
                    .frame(width: frameWidth)
                    .offset(x: previousExist ? -frameWidth : 0)
                
                if nextExist {
                    content(whateverData[dataIndex + 1], .nextView)
                        .frame(width: frameWidth)
                        .offset(x: previousExist ? -frameWidth : 0)
                }
            }
            .onAppear{
                if let jumpTo {
                    if let pos = whateverData.firstIndex(of: jumpTo){
                        dataIndex = pos
                    }
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

enum ViewPosition {
    case centerView
    case previousView
    case nextView
}

struct WeekView: View {
    @EnvironmentObject var dayplaner: DayPlanner
    let date: Date
    let week = ["Mo","Di","Mi","Do","Fr","Sa","So",]
    
    var viewPosition = ViewPosition.centerView
    
    init(of date: Date, viewPosition: ViewPosition) {
        self.date = date
        self.viewPosition = viewPosition
    }
    
    var body: some View {
        let datesInAWeek = dayplaner.datesInAWeek(from: date)
        HStack{
            Spacer()
            ForEach(datesInAWeek.indices, id: \.self){ i in
                let d = datesInAWeek[i]
                VStack{
                    VStack{
                        Text(week[i])
                            .padding(.bottom, 5)
                        Text(d.dayNum())
                            .bold()
                    }
                    .foregroundStyle(dayplaner.isCurrent(d) ? .white : .black)
                        .background(
                            ZStack{
                                if dayplaner.isCurrent(d) {
                                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                        .fill(.primary)
                                        .frame(width: 35, height: 60)
                                }
                            }
                        )
                }
                .onTapGesture {
                    dayplaner.setCurrentDate(to: d)
                }
                Spacer()
            }
        }
        .onChange(of: date) { d in
            if viewPosition == .centerView {
                let position = dayplaner.currentPositionInWeek()
                let datesInAWeek = dayplaner.datesInAWeek(from: d)
                dayplaner.setCurrentDate(to: datesInAWeek[position])
            }
        }
    }
}

struct CreateButton: View {
    @State private var isPresented = false
    var body: some View {
        Button(action: {
            self.isPresented.toggle()
        }){
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.green)
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .sheet(isPresented: $isPresented){
            CreateView()
        }
    }
}

struct DayView: View {
    @EnvironmentObject var dayplanner: DayPlanner
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle (cornerRadius: 0)
                . fill(Color.yellow)
            .ignoresSafeArea()
            
            LazyVStack {
                ForEach(dayplanner.tasks, id:\.self) { task in
                    TaskView(for: task)
                }
            }
            .padding()
        }
    }
}

struct TaskView: View {
    private var task: Task
    
    init(for task: Task) {
        self.task = task
    }
    
    var body: some View {
        
        HStack {
            Text("6:00")
            VStack {
                ZStack{
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                    Image(systemName: "at")
                        .foregroundStyle(.black)
                        .imageScale(.large)
                }
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
            
            VStack(alignment: .leading) {
                Text("6:00")
                Text(task.taskDescription)
                    .bold()
            }
            
            Spacer()
            Image(systemName: "checkmark")
                .padding(5)
                .background(.white, in: Circle())
        }
    }
}

















#Preview {
    TestCalender()
}
