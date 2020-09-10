//
//  SignInViewController.swift
//  Cocoa Chat
//
//  Created by Jamie Kim  on 8/29/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    

    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func signinPressed(_ sender: UIButton) {
           if let email = emailTextfield.text, let password = passwordTextfield.text{
                           Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                               if let e = error{
                                   print(e)
                               }else{
                                   //navigate to chatview controller
                                self.performSegue(withIdentifier: K.signinSegue, sender: self)
                            }
                            
            }
        }
    }
}

                         
