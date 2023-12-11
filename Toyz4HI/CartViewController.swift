//
//  CartViewController.swift
//  Toyz4HI
//
//  Created by prk on 12/7/23.
//

import UIKit
import CoreData

class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tvCart: UITableView!
    
    var arrCart = [cart]()
    
    var context: NSManagedObjectContext!
    
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCart.delegate = self
        tvCart.dataSource = self
        
        let tabBar = tabBarController as! HomeTabBarController
        email = tabBar.emailCurrent
        
        print("Email \(email!)")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        fetchedUserCart()

        for data in arrCart {
            print(data.name)
            print(data.price)
        }
    }
    
    func fetchedUserCart(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results{
                if( (data.value(forKey: "email") as! String) == email )  {
                    arrCart.append(cart(
                        name: (data.value(forKey: "gameName") as! String),
                        price: (data.value(forKey: "price") as! Int),
                        image: (data.value(forKey: "image") as! String)
                    ))
                }
            }
            print("Fetch success")
            tvCart.reloadData()
        }catch{
            print("Fetching error")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGames") as! CartTableViewCell
        
        cell.nameLabel.text = arrCart[indexPath.row].name
        cell.priceLabel.text = "Rp. \(arrCart[indexPath.row].price)"
        cell.gameImage.image = UIImage(named: arrCart[indexPath.row].image)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
