//
//  AdminAddGameViewController.swift
//  Toyz4HI
//
//  Created by prk on 12/4/23.
//

import UIKit

class AdminAddGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var gameNameTxt: UITextField!
    
    @IBOutlet weak var categoryTxt: UITextField!
    
    @IBOutlet weak var descTxt: UITextField!
    
    @IBOutlet weak var priceTxt: UITextField!
    
    @IBAction func imageOptionBtn(_ sender: Any) {
        
    }
    
    @IBAction func addGameBtn(_ sender: Any) {
        guard let gameName = gameNameTxt.text, !gameName.isEmpty else {
            showAlert(title:"Game name is empty",message: "Game name must not be empty.")
            return
        }
        
        guard let category = categoryTxt.text, !category.isEmpty else {
            showAlert(title:"Category is empty",message: "Category must not be empty.")
            return
        }
        
        guard let desc = descTxt.text, !desc.isEmpty else {
            showAlert(title:"Description is empty",message: "Description must not be empty.")
            return
        }
        
        guard let price = priceTxt.text, !price.isEmpty else {
            showAlert(title:"Price is empty",message: "Price must not be empty.")
            return
        }
        
        
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}
