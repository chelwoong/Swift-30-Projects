//
//  ViewController.swift
//  Todo
//
//  Created by woong on 29/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    // MARK: - Variables and Properties
    var cellIdentifire = "todoCell"
    var todoes = [Todo]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? AddTodoViewController else {
            return
        }
        
        nextVC.addTodoDelegate = self
    }
    
}

// MARK: - extensions

// MARK: TableView DataSource
extension TodoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        guard let todoCell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? TodoTableViewCell else {
            return defaultCell
        }
        todoCell.todoImageView.image = todoes[indexPath.row].todoIcon
        todoCell.todoLabel.text = todoes[indexPath.row].todoName
        todoCell.todoDateLabel.text = todoes[indexPath.row].todoDate
        
        return todoCell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if editing && !tableView.isEditing {
            tableView.setEditing(true, animated: animated)
            self.editButtonItem.title = "Done"
        } else {
            tableView.setEditing(false, animated: animated)
            self.editButtonItem.title = "Edit"
        }
    }
}

// MARK: TableView Delegate
extension TodoViewController: UITableViewDelegate {
    
}

// MARK: TableView AddTodo
extension TodoViewController: AddTodo {
    func addTodo(_ todo: Todo) {
        todoes.append(todo)
        tableView.reloadData()
    }
}
