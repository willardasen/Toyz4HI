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

        initCart()
//        fetchedUserCart()
//
//        for data in arrCart {
//            print(data.name)
//            print(data.price)
//        }
    }
    
    
    func initCart(){
        arrCart.append(cart(name: "GOW", price: 200000, image: "GOW"))
    }
    
    func fetchedUserCart(){
//        arrCart.removeAll()
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
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let oldNameCart = arrCart[indexPath.row].name
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
            
            request.predicate = NSPredicate(format: "email==%@ && gameName==%@", email,oldNameCart)
            
            do{
                let results = try context.fetch(request) as! [NSManagedObject]
                
                for data in results{
                    context.delete(data)
                }
                
                try context.save()
                
                fetchedUserCart()
                
                for data in arrCart{
                    print(data.name)
                    print(data.price)
                }
            }catch{
                print("Error deleting")
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchedUserCart()
    }
}
