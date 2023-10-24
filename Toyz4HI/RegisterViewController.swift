//
//  RegisterViewController.swift
//  Toyz4HI
//
//  Created by prk on 20/10/23.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    
    @IBAction func registerBtn(_ sender: Any) {
        
        guard let username = usernameTxt.text, !username.isEmpty else {
            showAlert(title:"Username is empty",message: "Username must not be empty.")
            return
        }
        
        
        guard let email = emailTxt.text, !email.isEmpty else {
            showAlert(title:"Email is empty",message: "Email must not be empty.")
            return
        }
        
        guard let password = passwordTxt.text, !password.isEmpty else {
            showAlert(title:"Password is empty",message: "Password must not be empty.")
            return
        }
        
        guard let confirmPass = emailTxt.text, !email.isEmpty else {
            showAlert(title:"Confirm Password is empty",message: "Confirm Password must not be empty.")
            return
        }
        
        if username.count < 2{
            showAlert(title:"Username is less than 2 letters",message: "Username must at least has 2 letters")
            return
        }
        
        if email.count < 5{
            showAlert(title:"Email is less than 5 letters",message: "Email must at least has 5 letters")
            return
        }
        
        if !(email.hasSuffix(".com") && email.contains("@")) {
            showAlert(title: "Email is not valid", message: "Email must contain @ and ends with .com")
            return
        }
        
        if password != confirmPass{
            showAlert(title:"Password and Confirm Password don't match",message: "Password and Confirm Password must be the same")
            return
        }
        
        // yang kureng: 1. validasi email has already exist 2.masukan ke database
        
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
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
