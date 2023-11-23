//
//  TodoListViewController.swift
//  TodoAppCloud
//
//  Created by Jiaqi Li on 11/22/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var todos:[String] = [String]()
    var txtField: UITextField?
    
    var uid: String = ""
    var db: Firestore!
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let uid = Auth.auth().currentUser?.uid else {return}
        self.uid = uid
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAllTodos()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    
    @IBAction func addTodoAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add Todo Item", message: "", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "Add", style: .default){ action in
            guard let todo = self.txtField?.text else {return}
            self.addToDB(todo: todo)
        
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel){
             action in
            
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        alertController.addTextField{ txtField in
            txtField.placeholder = "Type something here"
            self.txtField = txtField
        }
        
        self.present(alertController, animated: true){
        }
    }
    
    func addToDB(todo : String){
        print(todo)
        let newTodo = db.collection(uid).document()
        newTodo.setData([
            "todo": todo
        ])
        getAllTodos()
    }
    
    func getAllTodos(){
        todos = [String]()
        db.collection(uid).getDocuments(){ QuerySnapshot  ,err in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }
            for document in QuerySnapshot!.documents {
                guard let todo = document.data()["todo"] as? String else {continue}
                self.todos.append(todo)
            }
            self.tblView.reloadData()
        }
    }
}
