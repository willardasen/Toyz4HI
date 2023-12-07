//
//  AdminViewController.swift
//  Toyz4HI
//
//  Created by prk on 11/24/23.
//

import UIKit
import CoreData


class AdminViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tvGames: UITableView!
    
    var arrGames = [games]()
    var context: NSManagedObjectContext!
    
    func fetchGameData() {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGames") as! AdminTableViewCell
        print("Configuring cell for row \(indexPath.row)")
        
        cell.nameLbl.text = arrGames[indexPath.row].name
        cell.categoryLbl.text = arrGames[indexPath.row].category
        cell.descLbl.text = arrGames[indexPath.row].desc
        cell.priceLbl.text = "Rp\(arrGames[indexPath.row].price)"
        cell.gameImage.image = UIImage(named: arrGames[indexPath.row].image!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        tvGames.delegate = self
        tvGames.dataSource = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        fetchGameData()
        
        for data in arrGames {
            print(data.name!)
            print(data.category!)
            print(data.desc!)
            print(data.price)
            print("image string: \(data.image!)")
            print()
        }
    }
    
    
}
