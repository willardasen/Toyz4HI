//
//  RegisterViewController.swift
//  Toyz4HI
//
//  Created by prk on 20/10/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    var arrUser: [String] = []
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        context = appDelegate.persistentContainer.viewContext
    }
    

    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    
    @IBAction func registerBtn(_ sender: Any) {
        
        fetchUserData()
        
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
        
        guard let confirmPass = confirmPassTxt.text, !email.isEmpty else {
            showAlert(title:"Confirm Password is empty",message: "Confirm Password must not be empty.")
            return
        }
        
        if username.count < 2{
            showAlert(title:"Username is less than 2 letters",message: "Username must at least has 2 letters")
            
        }
        
        if email.count < 5{
            showAlert(title:"Email is less than 5 letters",message: "Email must at least has 5 letters")
            
        }
        
        if !(email.hasSuffix(".com") && email.contains("@")) {
            showAlert(title: "Email is not valid", message: "Email must contain @ and ends with .com")
            
        }
        
        if password != confirmPass{
            showAlert(title:"Password and Confirm Password don't match",message: "Password and Confirm Password must be the same")
            
        }
        
        if(arrUser.contains(email)){
            showAlert(title: "Email exists", message: "This email has already existed")
        }
        
        
        
        let entityTarget = NSEntityDescription.entity(forEntityName: "User", in: context)
        if (entityTarget != nil) {
            let newUser = NSManagedObject(entity: entityTarget!, insertInto: context)
            newUser.setValue(email, forKey: "email")
            newUser.setValue(username, forKey: "name")
            newUser.setValue(password, forKey: "password")
        }

        do{
            try context.save()
            print("Save Success")
        }catch{
            print("register error")
        }
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func fetchUserData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for data in results{
                arrUser.append(data.value(forKey: "email") as! String)

            }
            print("fetching successful")
        }catch{
            print("fetching failed")
        }
    }

}
