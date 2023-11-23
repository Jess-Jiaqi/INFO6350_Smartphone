//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Jiaqi Li on 11/4/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

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
        
        if email.isEmail == false{
            lblError.text = "Please enter valid email"
            lblError.isHidden = false
            return
        }
        
        if password.isValidPassword == false {
            lblError.text = "Wrong password"
            lblError.isHidden = false
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password){ [weak self] authResult, error in
            guard let strongSelf = self else {return}
            
            if error != nil {
//                guard let errorDesc = error?.localizedDescription else {return}
                strongSelf.lblError.isHidden = false
                strongSelf.lblError.text = error?.localizedDescription
                return
            }
            strongSelf.txtPassword.text = ""
            strongSelf.lblError.isHidden = true
            strongSelf.performSegue(withIdentifier: "segueLogin", sender: strongSelf)
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
