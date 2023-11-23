//
//  AddTodoViewController.swift
//  TodoApp
//
//  Created by Jiaqi Li on 11/21/23.
//

import UIKit
import RealmSwift

class AddTodoViewController: UIViewController {
    
    lazy var db = try! Realm()

    @IBOutlet weak var txtTodo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveTodoAction(_ sender: Any) {
        do {
            guard let todoTxt = txtTodo.text else {return}
            let todo = ToDoClass()
            todo.todo = todoTxt
            print(db.configuration.fileURL)
            try db.write{
                db.add(todo, update: .modified)
            }
            self.navigationController?.popViewController(animated: true)
        }catch let error as NSError{
            print("Error in writing to Realm DB: \(error.localizedDescription)")
        }
    }
    
}
