//
//  ViewController.swift
//  RealmMemo
//
//  Created by cmStudent on 2021/09/04.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let todos = RealmManager.shared.load(Todo.self)
    

    @IBOutlet private weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView(tableView)
        print(RealmManager.shared.load(Todo.self))
    }
    
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.dataSource = self
    }
    
    private func presentAlert() {
        let title = "アラート"
        let message = "Totoを入力してください"
        var myTextField = UITextField()
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { textField in
            myTextField = textField
        }
        alert.addAction(UIAlertAction(title: "追加", style: .default) { _ in
            if let name = myTextField.text, !name.isEmpty {
                RealmManager.shared.savedTodo(name: myTextField.text!)
                self.tableView.reloadData()
            } else {
                print("テキストフィールドに入力してください")
            }
        })
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        DispatchQueue.main.async { self.present(alert, animated: true) }
    }

    
    @IBAction private func tappedAddButton(_ sender: UIBarButtonItem) {
        presentAlert()
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        todoCell.textLabel?.text = todos[indexPath.row].name
        return todoCell
    }
    
}

