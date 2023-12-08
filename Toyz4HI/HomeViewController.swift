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
    var email: String?
    
    
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
//        let tabBar = tabBarController as! HomeTabBarController
//
//        print("ini pny tabbar" + tabBar.emailCurrent)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGames") as! HomeTableViewCell
        
        let cellName = arrGames[indexPath.row].name
        let cellCategory = arrGames[indexPath.row].category
        let cellDesc = arrGames[indexPath.row].desc
        let cellPrice = "Rp. \(arrGames[indexPath.row].price)"
        let cellImage = arrGames[indexPath.row].image
        
        cell.nameLbl.text = cellName
        cell.categoryLbl.text = cellCategory
        cell.descLbl.text = cellDesc
        cell.priceLbl.text = cellPrice
        cell.gamesImg.image = UIImage(named: cellImage!)
        
        let tabBar = tabBarController as! HomeTabBarController
        
        cell.handleInsert = {
            let entityTarget = NSEntityDescription.entity(forEntityName: "Cart", in: self.context)

            let newCart = NSManagedObject(entity: entityTarget!, insertInto: self.context )
            
            newCart.setValue(tabBar.emailCurrent, forKey: "email")
            newCart.setValue(cellName, forKey: "gameName")
            newCart.setValue(cellPrice, forKey: "price")
            
            do{
                try self.context.save()
                print("Added to Cart")
            }catch{
                print("Error while adding to cart")
            }
        }
        
        return cell
    }

}
