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
    }
    
    
    @IBAction func addTodoItem(_ sender: UIButton) {
        print("Add button tapped")
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "New Task"
        
        let vcTableview = storyboard?.instantiateViewController(identifier: "tableview") as! TodosTableViewController
        
        vc.updateTask = {
            print("Call updateTaks")
            DispatchQueue.main.async {
                print("updateTasks called from TodoViewController")
                vcTableview.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
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
