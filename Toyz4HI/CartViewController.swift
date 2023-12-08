//
//  CartViewController.swift
//  Toyz4HI
//
//  Created by prk on 12/7/23.
//

import UIKit

class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var arrGames = [games]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addToCardClicked(_ sender: Any) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGames") as! CartTableViewCell
        
        cell.nameLabel.text = arrGames[indexPath.row].name
        cell.priceLabel.text = "Rp. \(arrGames[indexPath.row].price)"
        cell.gameImage.image = UIImage(named: arrGames[indexPath.row].image!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
