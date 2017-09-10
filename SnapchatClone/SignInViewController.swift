//
//  SignInViewController.swift
//
//
//  Created by Alexis on 9/8/17.
//
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func turnUpTapped(_ sender: Any)
    {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if error != nil
            {
                print("Hey we have an error:\(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    
                    if error != nil
                    {
                        print("Hey we have an error:\(error)")
                    } else
                    {
                        print("Created user succesfully")
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                    
                })
                
            } else
            {
                print("Sign in Succesfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        }
    }
    
}
