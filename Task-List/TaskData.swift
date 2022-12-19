//
//  TaskData.swift
//  Task-List
//
//  Created by Brendon Crowe on 12/18/22.
//

import Foundation

struct Task {
    enum Status {
        case notStarted
        case inProgress
        case completed
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

}
