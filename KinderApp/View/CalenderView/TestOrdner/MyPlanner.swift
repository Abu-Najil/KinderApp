//
//  MyPlanner.swift
//  KinderApp
//
//  Created by Aldin Kolic on 19.07.24.
//

import Foundation

struct Task: Identifiable, Hashable {
    var taskDescription: String
    
    var id = UUID()
}

struct MyPlanner {
    private(set) var tasks: [Task]
    
    init(){
        tasks = [
            Task(taskDescription: "Answer Email"),
            Task(taskDescription: "Coffee Time")
        ]
    }
    
    mutating func createTask(_ task: String) {
        tasks.append(Task(taskDescription: task))
    }
}

var testTask = [
    Task(taskDescription: "Answer Email"),
    Task(taskDescription: "Coffee Time")
]
