//
//  LoginViewController.swift
//  Toyz4HI
//
//  Created by prk on 20/10/23.
// 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

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    var arrUser = [user]()
    
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        context = appDelegate.persistentContainer.viewContext
        
        initDummy()
        fetchUserData()
        
//        for user in arrUser {
//            print(user.email)
//            print(user.password)
//        }
    }
    
    func initDummy(){
        arrUser.append(user(email: "dummy@gmail.com", name: "dummy", password: "dummy"))
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
        
        
        if(email == "admin" && password == "admin"){
            if let nextPage = storyboard?.instantiateViewController(withIdentifier: "adminView"){
                self.navigationController?.pushViewController(nextPage, animated: true)
            }
            showAlert(title: "Login success", message: "Welcome, Admin")
        }
        
        if !(email.hasSuffix(".com") && email.contains("@")) {
            showAlert(title: "Email is not valid", message: "Email must contain @ and ends with .com")
        }

        
        // yang kureng: 1. validasi email dan password salah(cek dari database)
        for user in arrUser {
            if (user.email == email && user.password == password) {
                print(user.email)
                print(user.password)
                if let nextPage = storyboard?.instantiateViewController(withIdentifier: "tabBarView"){
                    self.navigationController?.pushViewController(nextPage, animated: true)
                    showAlert(title: "Login User", message: "Welcome, \(user.name)")
                }
            }
        }
        
        showAlert(title: "Invalid Credential", message: "Email or Password is wrong")
    }
    
    func fetchUserData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for data in results{
                arrUser.append(user(
                    email: data.value(forKey: "email") as! String,
                    name: data.value(forKey: "name") as! String,
                    password: data.value(forKey: "password") as! String)
                )
            }
            print("fetching successful")
        }catch{
            print("fetching failed")
        }
    }
        
        
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
