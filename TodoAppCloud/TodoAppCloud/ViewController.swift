//
//  ViewController.swift
//  TodoAppCloud
//
//  Created by Jiaqi Li on 11/21/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if email.isEmail == false {
            lblError.text = "Please enter valid Email."
            lblError.isHidden = false
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else {return}
            if error != nil {
                strongSelf.lblError.text = error?.localizedDescription
                strongSelf.lblError.isHidden = false
                return
            }
            strongSelf.txtPassword.text = ""
            strongSelf.lblError.isHidden = true
            strongSelf.performSegue(withIdentifier: "segueLogin", sender: strongSelf)
            
        }
    }
    
    
    
}

