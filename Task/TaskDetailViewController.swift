//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Iury Faria on 13/05/23.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    let task: Task
    
    init(task: Task) {
            self.task = task
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
