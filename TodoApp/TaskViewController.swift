//
//  TaskViewController.swift
//  TodoApp
//
//  Created by Danki on 13.05.21.
//

import UIKit

class TaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var field: UITextField!
    
    var updateTask: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    // allow the func to be used as selector
    @objc func saveTask() {
        print("savetask called")
        guard let text = field.text, !text.isEmpty  else {
            print("no text in field")
                return
            }
        // use UserDefault to save
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            print("no tasks")
            return
        }
        
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        print("new task added ", UserDefaults().value(forKey: "task_\(newCount)")!)
        // Update the table view
        print("call updateTask")
        updateTask?()
        
        navigationController?.popViewController(animated: true)
    }

}
