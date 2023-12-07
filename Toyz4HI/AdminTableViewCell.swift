//
//  AdminTableViewCell.swift
//  Toyz4HI
//
//  Created by prk on 12/7/23.
//

import UIKit

class AdminTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var gameImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
