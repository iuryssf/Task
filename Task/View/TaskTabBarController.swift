//
//  TaskTabBarController.swift
//  Task
//
//  Created by Iury Faria on 01/05/23.
//

import UIKit

class TaskTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createTaskListViewController(), createCompletedListViewController()]
    }
    

    func createTaskListViewController() -> UINavigationController {
        let taskListViewController = TaskListViewController()
        taskListViewController.title = "Tasks"
        taskListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return UINavigationController(rootViewController: taskListViewController)
        
    }
    
    func createCompletedListViewController() -> UINavigationController {
        let completedListViewController = CompletedListViewController()
        completedListViewController.title = "Completed"
        completedListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        return UINavigationController(rootViewController: completedListViewController)
    }

}
