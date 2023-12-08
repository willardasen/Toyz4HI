//
//  HomeTabBarController.swift
//  Toyz4HI
//
//  Created by prk on 11/24/23.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    var emailCurrent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        print("ini muncul hahahahaha " + emailCurrent)
        // Do any additional setup after loading the view.
    }

}
