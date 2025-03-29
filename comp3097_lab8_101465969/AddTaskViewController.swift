//
//  AddTaskViewController.swift
//  comp3097_lab8_101465969
//
//  Created by Joshua Nuezca on 2025-03-13.
//
import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("addtaskviewcontroller loaded")
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        guard let taskName = taskTextField.text, !taskName.isEmpty else { return }
        
        saveTask(name: taskName)
        
        if let taskListVC = storyboard?.instantiateViewController(identifier: "TaskListViewController") as? TaskListViewController {
            navigationController?.pushViewController(taskListVC, animated: true)
        }
    }
    
    func saveTask(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let newTask = Task(context: context)
        newTask.name = name
        
        do {
            try context.save()
        } catch {
            print("Failed to save task: \(error)")
        }
    }
    
}
