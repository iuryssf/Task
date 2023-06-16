////
////  AddTaskViewController.swift
////  Task
////
////  Created by Iury Faria on 13/05/23.
////
//
//import UIKit
//
//protocol AddTaskDelegate: AnyObject {
//    func didCreateTask(_ task: Task)
//}
//
//class AddTaskViewController: UIViewController {
//
//    weak var delegate: AddTaskDelegate?
//
//    let taskTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter task name"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//
//    let createButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Create", for: .normal)
//        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    let datePicker: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
//        datePicker.preferredDatePickerStyle = .compact
//        return datePicker
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureViewController()
//        configureUI()
//
//    }
//
//    func configureViewController() {
//        view.backgroundColor = .systemBackground
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissVC))
//    }
//
//    func configureUI() {
//        view.addSubview(taskTextField)
//        view.addSubview(createButton)
//
//        taskTextField.delegate = self
//
//        taskTextField.translatesAutoresizingMaskIntoConstraints = false
//        createButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            taskTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            taskTextField.heightAnchor.constraint(equalToConstant: 50),
//
//            createButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
//            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            createButton.heightAnchor.constraint(equalToConstant: 40),
//
//        ])
//
//    }
//
//    @objc func dismissVC() {
//        dismiss(animated: true)
//    }
//
//    @objc private func createButtonTapped() {
//        createTask()
//    }
//
//    @objc private func datePickerValueChanged() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//
//        let selectedDate = datePicker.date
//        let dateString = dateFormatter.string(from: selectedDate)
//        print(dateString)
//    }
//
//    private func createTask() {
//        guard let taskName = taskTextField.text else { return }
//        guard !taskName.isEmpty else {
//            displayError(message: "Task name cannot be empty")
//            return
//        }
//
//        let selectedDate = datePicker.date
//
//        let task = Task(title: taskName, date: selectedDate)
//        TaskManager.shared.addTask(task: task)
//        delegate?.didCreateTask(task)
//        dismiss(animated: true, completion: nil)
//    }
//
//
//    private func displayError(message: String) {
//        let alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//    }
//}
//
//extension AddTaskViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        createTask()
//        return true
//    }
//
//}

import UIKit

protocol AddTaskDelegate: AnyObject {
    func didCreateTask(_ task: Task)
}

class AddTaskViewController: UIViewController {

    weak var delegate: AddTaskDelegate?

    let taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter task name"
        textField.borderStyle = .roundedRect
        return textField
    }()

    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        return button
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUI()
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissVC))
    }

    func configureUI() {
        view.addSubview(taskTextField)
        view.addSubview(createButton)
        view.addSubview(datePicker)

        taskTextField.delegate = self

        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            taskTextField.heightAnchor.constraint(equalToConstant: 50),

            createButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createButton.heightAnchor.constraint(equalToConstant: 40),

            datePicker.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }

    @objc private func createButtonTapped() {
        createTask()
    }

    private func createTask() {
        guard let taskName = taskTextField.text, !taskName.isEmpty else {
            displayError(message: "Task name cannot be empty")
            return
        }

        let selectedDate = datePicker.date

        let task = Task(title: taskName, date: selectedDate)
        TaskManager.shared.addTask(task: task)
        delegate?.didCreateTask(task)
        dismiss(animated: true, completion: nil)
    }

    private func displayError(message: String) {
        let alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createTask()
        return true
    }
}

