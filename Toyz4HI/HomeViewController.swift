//
//  HomeViewController.swift
//  Toyz4HI
//
//  Created by prk on 24/10/23.
//

import UIKit

//NB: ini kemgkinan bs ganti karna nanti pake database
struct games {
    var name : String?
    var category : String?
    var desc : String?
    var price : Int
    var image : String?
}


class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet weak var tvGames: UITableView!
    
    
    //NB: ini kemgkinan bs ganti karna nanti pake database
    var arrGames = [games]()
    
    func initGames(){
        arrGames.append(games(name: "God of War", category: "Adventure, RPG", desc: "BOI BOI BOI BOI BOI", price: 500000, image: "GOW"))
        arrGames.append(games(name: "God of War", category: "Adventure, RPG", desc: "BOI BOI BOI BOI BOI", price: 500000, image: "GOW"))
        arrGames.append(games(name: "God of War", category: "Adventure, RPG", desc: "BOI BOI BOI BOI BOI", price: 500000, image: "GOW"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        initGames()
        tvGames.dataSource = self
        tvGames.delegate = self
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
