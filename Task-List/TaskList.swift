//
//  ViewController.swift
//  Task-List
//
//  Created by Brendon Crowe on 12/18/22.
//

import UIKit

class TaskList: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var sortAscending = true
    
    private var statuses = [[Task]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        tableView.dataSource = self
        title = "Tasks"
        loadData()
        
        sortData(true)
    }
    
    func loadData() {
        statuses = Task.taskSections()
    }
    
    func sortData(_ sortAscending: Bool) {
        if sortAscending {
           
            navigationItem.rightBarButtonItem?.title = "Ascending"
        } else {
        
            navigationItem.rightBarButtonItem?.title = "Descending"
        }
        
    }
        
        
    
    
    @IBAction func sortButtonTapped(_ sender: UIBarButtonItem) {
        sortAscending.toggle()
        sortData(sortAscending)

    }
    
}

extension TaskList: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return statuses.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        if section == 0 {
            sectionName = "Not Started"
        } else if section == 1 {
            sectionName = "In Progress"
        } else {
            sectionName = "Completed"
        }
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = statuses[indexPath.section][indexPath.row]
        
        // cell configuration
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = task.name
        cellContent.secondaryText = task.dueDate.description
        cell.contentConfiguration = cellContent
        return cell
    }
    
}

