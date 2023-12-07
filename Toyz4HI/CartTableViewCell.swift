//
//  CartTableViewCell.swift
//  Toyz4HI
//
//  Created by prk on 12/7/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
