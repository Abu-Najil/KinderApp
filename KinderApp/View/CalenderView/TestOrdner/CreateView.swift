//
//  CreateView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 19.07.24.
//
 
import SwiftUI

struct CreateView: View {
    @EnvironmentObject var dayplanner: DayPlanner
    @State private var showWhatView = true
    var body: some View {
        VStack {
            HeaderView()
                .padding()
            
            Divider()
            
            if showWhatView {
                WhatView(showWhatView: $showWhatView)
                    .padding()
            } else {
                
                CreateTaskView()
                    .padding()
            }
             
            Spacer()
        }
    }
}


struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack{
            Text("Create Task")
            Spacer()
            Image(systemName: "xmark")
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .bold()
    }
}


struct WhatView: View {
    
    @EnvironmentObject var dayplanner: DayPlanner
    @Binding var showWhatView: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("What?")
                .font(.title2)
            
            TaskField(dayplanner.taskDescription)
            
            Spacer()
            //Text("\(dayplanner.currentDate)")
            Button {
                showWhatView.toggle()
            }label: {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.title2)
                    .bold()
            }
            .buttonStyle(.bordered)
            
        }
    }
}



struct TaskField: View {
    
    @EnvironmentObject var dayplanner: DayPlanner
    @State private var activity: String = ""
    
    init(_ activity: String) {
        _activity = State(initialValue: activity)
    }
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                Image(systemName: "at")
                    .foregroundStyle(.white)
                    .imageScale(.large)
            }
            .shadow(radius: 5)
            
            VStack {
                TextField("Answert Emails", text: $activity)
                    .font(.title2)
                Divider()
            }
            .padding(.leading)
        }
        .onChange(of: activity) { desc in
            dayplanner.taskDescription = desc
        }
    }
}



struct CreateTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dayplanner: DayPlanner
    var body: some View {
        VStack {
            TaskField(dayplanner.taskDescription)
            
            Spacer()
            Button {
                dayplanner.createTask()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Create Task")
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .bold()
            }
            .buttonStyle(.bordered)
        }
    }
}
















struct CreateView_Previews: PreviewProvider {
    static let dayPlaner = DayPlanner()
    static var previews: some View {
        CreateView()
            .environmentObject(dayPlaner)
    }
}
