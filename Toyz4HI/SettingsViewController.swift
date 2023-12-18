//
//  SettingsViewController.swift
//  Toyz4HI
//
//  Created by prk on 18/12/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = tabBarController as! HomeTabBarController
        nameLabel.text = tabBar.usernameCurrent
        emailLabel.text = tabBar.emailCurrent
        // Do any additional setup after loading the view.
    }

}
