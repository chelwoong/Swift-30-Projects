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
        print("TodoViewVC viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TodoViewVC viewDidAppear")
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? AddTodoViewController else {
            return
        }
        
        nextVC.addTodoDelegate = self
    }
}

// MARK: - extension
extension TodoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todoes.count)
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
    
    
}

extension TodoViewController: UITableViewDelegate {
    
}


extension TodoViewController: AddTodo {
    func addTodo(_ todo: Todo) {
        todoes.append(todo)
        tableView.reloadData()
    }
}
