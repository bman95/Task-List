//
//  TaskData.swift
//  Task-List
//
//  Created by Brendon Crowe on 12/18/22.
//

import Foundation

struct Task {
    enum Status: Int {
        case notStarted = 0
        case inProgress = 1
        case completed = 2
    }
    
    let name: String
    let status: Status
    let dueDate: Date
    
    static var allTasks: [Task] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return [
            Task(name: "Create project roadmap",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "12-25-2022")!),
            Task(name: "Source information session speakers",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "12-26-2022")!),
            Task(name: "Secure event funding",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-27-2022")!),
            Task(name: "Secure venue for keynote",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-28-2022")!),
            Task(name: "Identify event KPIs",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "12-29-2022")!),
            Task(name: "Create internal newsletter advertising event",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "12-25-2022")!),
            Task(name: "Submit food budget",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-26-2022")!),
            Task(name: "Create event logo",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "12-29-2022")!),
            Task(name: "Make companion iOS application for event",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "12-25-2022")!),
            Task(name: "Get celebrity speaker (Tim Cook?)",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "12-30-2022")!),
            Task(name: "Purchase event insurance",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-31-2022")!),
            Task(name: "Get event SWAG",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-23-2022")!),
            Task(name: "Secure seat with SpaceX",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "12-24-2022")!),
            Task(name: "Conduct brainstorming session",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-29-2022")!),
            Task(name: "Get all necessary headcount allocated",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "12-19-2022")!),
        ]
    }
    
    
    // section function will be written below
    
    static func taskSections() -> [[Task]] {
        
        let sortedStatuses = allTasks.sorted { $0.status.rawValue < $1.status.rawValue }
        let uniqueStatuses = Set(sortedStatuses.map { $0.status.rawValue })
        
        // creates 3 arrays containing which should contain [[notStarted], [inProgress], [Completed]]
        var sectionsArray = Array(repeating: [Task](), count: uniqueStatuses.count)
        
        var currentIndex = 0 // this variable represents the first array within the sectionsArray [[0], [1], [2]]
        var currentTaskStatus = sortedStatuses.first?.status.rawValue
        
        for status in sortedStatuses {
            if status.status.rawValue == currentTaskStatus {
                sectionsArray[currentIndex].append(status)
            } else {
                currentIndex += 1
                currentTaskStatus = status.status.rawValue
                sectionsArray[currentIndex].append(status)
            }
        }
        
        return sectionsArray
    }
}

