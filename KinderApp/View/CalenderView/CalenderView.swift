//
//  CalenderView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI

struct CalenderView: View {
    
    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        NavigationStack{
            ZStack {
                ForEach(weekStore.allWeeks) { week in
                    VStack{
                        HStack {
                            ForEach(0..<7) { index in
                                VStack(spacing: 8) {
                                    
                                    Text(weekStore.dateToString(date: week.date[index], format: "EEE"))
                                        .font(.system(size:14))
                                        .fontWeight(.semibold)
                                        .frame(maxWidth:.infinity)
                                    
                                    Text(weekStore.dateToString(date: week.date[index], format: "d"))
                                        .font(.system(size:14))
                                        .frame(maxWidth:.infinity)
                                    
                                }
                                .onTapGesture {
                                    // Updating Current Day
                                    weekStore.currentDate = week.date[index]
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .background(
                            Rectangle()
                                .fill(.white)
                        )
                    }
                    .offset(x: draggingItem, y: 0)
                    //.zIndex(1.0 - abs(distance(week.id)) * 0.1)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 16)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width
                    }
                    .onEnded { value in
                        
                        if value.predictedEndTranslation.width > 0 {
                            draggingItem = snappedItem + 1
                        } else {
                            draggingItem = snappedItem - 1
                        }
                        snappedItem = draggingItem
                        
                        weekStore.update(index: Int(snappedItem))
                        
                    }
            )
            .toolbar{
                ToolbarItem(placement: .automatic){
                    Button("Heute") {
                        
                    }
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                
                ToolbarItem(placement: .automatic){
                    Button {
                        
                    }label: {
                        Image(systemName: "list.bullet.below.rectangle")
                    }
                }
                
                ToolbarItem(placement: .automatic){
                    Button {
                        
                    }label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
                ToolbarItem(placement: .automatic){
                    Button {
                        // Kalendereintag hinzufügen durch eine zweite View im Sheed
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        
                    }label: {
                        Text("November")
                        Image(systemName: "chevron.forward")
                            .font(.footnote)
                    }
                }
            }
            
            ScrollView{
                
            }
            .background(.yellow)
        }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
        return sin(angle) * 200
    }
}

#Preview {
    CalenderView()
}


