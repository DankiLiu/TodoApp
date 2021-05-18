//
//  TodosTableViewController.swift
//  TodoApp
//
//  Created by Danki on 12.05.21.
//

import UIKit

class TodosTableViewController: UITableViewController {

    var tasks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true

        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            print("Setup UserDefault")
            UserDefaults().set(true, forKey: "setup")
            // Current number of tasks 
            UserDefaults().set(0, forKey: "count")
            print("set up the data, count == ", UserDefaults().value(forKey: "count")!)
        }
        print("call updateTasks()")
        //reomveAllTasks()
        updateTasks()
    }

    
    func updateTasks(){
        print("updateTasks()")
        tasks.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0...count {
            if let task = UserDefaults().value(forKey: "task_\(x + 1)") as? String{
                tasks.append(task)
            }
        }
        //print("the lastest task is ", UserDefaults.value(forKey: "task_\(count+1)")!)
    }
    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    */
    
    // Number of rows

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("tableView called count = ", tasks.count)
        return tasks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]
        print("tableView called text = ", cell.textLabel?.text)
        return cell
    }
    
    func reomveAllTasks() {
        if let count = UserDefaults().value(forKey: "count") as? Int {
            for i in 0...count {
                UserDefaults().removeObject(forKey: "task_\(i + 1)")
            }
        }
    }
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = self.todos[sourceIndexPath.row]
        todos.remove(at: sourceIndexPath.row)
        todos.insert(moveObject, at: destinationIndexPath.row)
    }
 */
}

