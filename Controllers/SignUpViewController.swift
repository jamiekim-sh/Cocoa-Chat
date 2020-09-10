//
//  SignUpViewController.swift
//  Cocoa Chat
//
//  Created by Jamie Kim  on 8/29/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
   
    @IBAction func signupPressed(_ sender: UIButton) {
        //optional binding+chaining to put into real string
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                //error is also optional
                if let e = error{
                    print(e.localizedDescription)
                }
                //navigate to ChatView controller - trigger seque
                else{
                    //keyword self required in closrue
                    self.performSegue(withIdentifier: K.signupSegue, sender: self)
                }
              
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
