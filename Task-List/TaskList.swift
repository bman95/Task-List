//
//  ViewController.swift
//  Task-List
//
//  Created by Brendon Crowe on 12/18/22.
//

import UIKit

class TaskList: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // later we may change the value of tasks based on what we want to do (i.e sort)
    private var tasks = Task.allTasks
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()        
        tableView.dataSource = self
        title = "Tasks"

        
        print("There are \(Task.allTasks.count) tasks in our struct")

    }
    
}

extension TaskList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        
        // cell configuration
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = task.name
        cellContent.secondaryText = task.dueDate.description
        cell.contentConfiguration = cellContent
        return cell
    }
}

