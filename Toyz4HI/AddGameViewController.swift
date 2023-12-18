//
//  AddGameViewController.swift
//  Toyz4HI
//
//  Created by prk on 05/12/23.
//

import UIKit
import CoreData

class AddGameViewController: UIViewController {

    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        context = appDelegate.persistentContainer.viewContext
    }
    
    @IBOutlet weak var gameNameTxt: UITextField!
    
    @IBOutlet weak var categoryTxt: UITextField!
    
    @IBOutlet weak var descTxt: UITextField!
    
    @IBOutlet weak var priceTxt: UITextField!

    
    @IBAction func AddGameOnClick(_ sender: Any) {
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
        
        let entityTarget = NSEntityDescription.entity(forEntityName: "Game", in: context)
        
        if (entityTarget != nil) {
            let newGame = NSManagedObject(entity: entityTarget!, insertInto: context)
            
            newGame.setValue(gameName, forKey: "gameName")
            newGame.setValue(category, forKey: "category")
            newGame.setValue(desc, forKey: "gameDesc")
            newGame.setValue(Int(price), forKey: "price")
            newGame.setValue("GOW Ragnarok", forKey: "image")
        }
        
        do {
            try context.save()
            print("Successfully save game")
//            showAlert(title: "Save Successful", message: "New game data has been added")
        } catch {
            print("Error saving game")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
