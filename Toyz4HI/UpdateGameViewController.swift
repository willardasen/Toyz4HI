//
//  UpdateGameViewController.swift
//  Toyz4HI
//
//  Created by prk on 15/12/23.
//

import UIKit
import CoreData

class UpdateGameViewController: UIViewController {
    
    var gameUpdatedSection:games!
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var gameNameTxt: UITextField!
    
    @IBOutlet weak var categoryTxt: UITextField!
    
    @IBOutlet weak var decsTxt: UITextField!
    
    @IBOutlet weak var priceTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameNameTxt.text = gameUpdatedSection.name
        categoryTxt.text = gameUpdatedSection.category
        decsTxt.text = gameUpdatedSection.desc
        priceTxt.text = String(gameUpdatedSection.price)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateGameBtn(_ sender: Any) {
        //masi gagal
//        let oldGameName = gameUpdatedSection.name
//        let oldCategory = gameUpdatedSection.category
//        let oldDesc = gameUpdatedSection.desc
//        let oldPrice = gameUpdatedSection.price

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")

//        request.predicate = NSPredicate(format: "gameName == %@ AND category == %@ AND gameDesc == %@ AND price == %@", oldGameName!, oldCategory!, oldDesc!, oldPrice)
        
//        request.predicate = NSPredicate(format: "gameName == %@ AND category == %@ AND gameDesc == %@", oldGameName!, oldCategory!, oldDesc!)
        
//        request.predicate = NSPredicate(format: "price == %@", oldPrice)

        do{
            let results = try context.fetch(request) as! [NSManagedObject]

            for data in results{
                data.setValue(gameNameTxt.text, forKey: "gameName")
                data.setValue(categoryTxt.text, forKey: "category")
                data.setValue(decsTxt.text, forKey: "gameDesc")
                data.setValue(Int(priceTxt.text ?? "0"), forKey: "price")
            }

            try context.save()
            
            showAlert(title: "Update Successful", message: "The game data has been updated")

        }catch{
            print("Updating error")
        }
        
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
