//
//  HomeViewController.swift
//  Toyz4HI
//
//  Created by prk on 24/10/23.
//

import UIKit
import CoreData

class HomeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tvGames: UITableView!
    
    var arrGames = [games]()
    var context: NSManagedObjectContext!
    
    func initGames(){
        arrGames.append(games(name: "God of War", category: "Adventure, RPG", desc: "God of War[b] is an action-adventure game developed by Santa Monica Studio and published by Sony Interactive Entertainment. ", price: 500000, image: "GOW"))
        arrGames.append(games(name: "God of War", category: "Adventure, RPG", desc: "BOI BOI BOI BOI BOI", price: 500000, image: "GOW"))
        arrGames.append(games(name: "God of War", category: "Adventure, RPG", desc: "BOI BOI BOI BOI BOI", price: 500000, image: "GOW"))
    }
    
    func loadGame() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results {
                    arrGames.append(games(
                    name: (data.value(forKey: "gameName") as! String),
                    category: (data.value(forKey: "category") as! String),
                    desc: (data.value(forKey: "gameDesc") as! String),
                    price: (data.value(forKey: "price") as! Int),
                    image: (data.value(forKey: "image") as! String)
                ))
            }
            print("Fetch success")
            tvGames.reloadData()
        } catch {
            print("Cannot fetch game data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
//        initGames()
        tvGames.dataSource = self
        tvGames.delegate = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        loadGame()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGames") as! HomeTableViewCell
        
        cell.nameLbl.text = arrGames[indexPath.row].name
        cell.categoryLbl.text = arrGames[indexPath.row].category
        cell.descLbl.text = arrGames[indexPath.row].desc
        cell.priceLbl.text = "Rp. \(arrGames[indexPath.row].price)"
        cell.gamesImg.image = UIImage(named: arrGames[indexPath.row].image!)
        
        return cell
    }

}
