//
//  TaskCell.swift
//  Task
//
//  Created by Iury Faria on 01/05/23.
//

import UIKit

class TaskCell: UITableViewCell {
    static let reuseID = "TaskCell"

    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let completedIndicator = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(completedIndicator)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        completedIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            completedIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            completedIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            completedIndicator.widthAnchor.constraint(equalToConstant: 20),
            completedIndicator.heightAnchor.constraint(equalToConstant: 20)
        ])

        completedIndicator.layer.cornerRadius = 10
        completedIndicator.layer.borderWidth = 2
    }

    func configure(task: Task) {
        titleLabel.text = task.title
        dateLabel.text = DateFormatter.localizedString(from: task.date, dateStyle: .medium, timeStyle: .none)
        setCompletedIndicator(isCompleted: task.isCompleted)
    }

    private func setCompletedIndicator(isCompleted: Bool) {
        if isCompleted {
            completedIndicator.image = UIImage(systemName: "checkmark.circle.fill")
            completedIndicator.tintColor = .systemGreen
        }
        else {
            completedIndicator.image = UIImage(systemName: "circle")
            completedIndicator.tintColor = .systemGray
        }
    }
}

//import UIKit
//
//class TaskCell: UITableViewCell {
//    static let reuseID = "TaskCell"
//
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        return label
//    }()
//
//    private let dateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .gray
//        return label
//    }()
//
//    private let completedIndicator: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupUI() {
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(dateLabel)
//        contentView.addSubview(completedIndicator)
//
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//
//            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
//            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//
//            completedIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            completedIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            completedIndicator.widthAnchor.constraint(equalToConstant: 20),
//            completedIndicator.heightAnchor.constraint(equalToConstant: 20)
//        ])
//
//        completedIndicator.layer.cornerRadius = 10
//        completedIndicator.layer.borderWidth = 2
//    }
//
//    func configure(task: Task) {
//        titleLabel.text = task.title
//        dateLabel.text = DateFormatter.localizedString(from: task.date, dateStyle: .medium, timeStyle: .none)
//        setCompletedIndicator(isCompleted: task.isCompleted)
//    }
//
//    private func setCompletedIndicator(isCompleted: Bool) {
//        if isCompleted {
//            completedIndicator.image = UIImage(systemName: "checkmark.circle.fill")
//            completedIndicator.tintColor = .systemGreen
//        } else {
//            completedIndicator.image = UIImage(systemName: "circle")
//            completedIndicator.tintColor = .systemGray
//        }
//    }
//}


