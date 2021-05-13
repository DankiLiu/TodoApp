//
//  TodoViewController.swift
//  TodoApp
//
//  Created by Danki on 13.05.21.
//

import UIKit

class TodoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTodoItem(_ sender: UIButton) {
        var todoTableViewController: TodosTableViewController = TodosTableViewController()
        var todos = todoTableViewController.todos
        var newTodo: Todo = Todo(id: todos.count + 1, content: "This is a new todo", doing: false)
        todos.append(newTodo)
        todoTableViewController.tableView.reloadData()
        print("button on click")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
