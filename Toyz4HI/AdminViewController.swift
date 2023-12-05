//
//  AdminViewController.swift
//  Toyz4HI
//
//  Created by prk on 11/24/23.
//

import UIKit
import CoreData

class AdminViewController: UIViewController {

    var arrGame = [games]()
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        fetchGameData()
        
        for data in arrGame {
            print(data.name!)
            print(data.category!)
            print(data.desc!)
            print(data.price)
            print(data.image!)
            print()
        }
    }
    
    func fetchGameData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results {
                arrGame.append(games(
                    name: (data.value(forKey: "gameName") as! String),
                    category: (data.value(forKey: "category") as! String),
                    desc: (data.value(forKey: "gameDesc") as! String),
                    price: (data.value(forKey: "price") as! Int),
                    image: (data.value(forKey: "image") as! String)
                ))
            }
            print("Fetch success")
        } catch {
            print("Cannot fetch game data")
        }
    }
    
    
}
