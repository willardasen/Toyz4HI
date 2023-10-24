//
//  LoginViewController.swift
//  Toyz4HI
//
//  Created by prk on 20/10/23.
// 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

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var emailTxt: UITextField!
    
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let email = emailTxt.text, !email.isEmpty else {
            showAlert(title:"Email is empty",message: "Email must not be empty.")
            return
        }
        
        guard let password = passwordTxt.text, !password.isEmpty else {
            showAlert(title:"Password is empty",message: "Password must not be empty.")
            return
        }
        
        if !(email.hasSuffix(".com") && email.contains("@")) {
            showAlert(title: "Email is not valid", message: "Email must contain @ and ends with .com")
            return
        }
        
        // yang kureng: 1. validasi email dan password salah(cek dari database)
        
        
    }
    
   
        
        
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
