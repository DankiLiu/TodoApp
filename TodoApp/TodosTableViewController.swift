//
//  TodosTableViewController.swift
//  TodoApp
//
//  Created by Danki on 12.05.21.
//

import UIKit

class TodosTableViewController: UITableViewController {

    var todos = [
        Todo(id: 0, content: "Write a todo app", doing: false),
        Todo(id: 1, content: "Get up before 8", doing: false),
        Todo(id: 2, content: "Status: doing", doing: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)

        cell.textLabel?.text = todos[indexPath.row].content

        return cell
    }
    
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
}

struct Todo {
    var id: Int
    var content: String
    var doing: Bool
}
