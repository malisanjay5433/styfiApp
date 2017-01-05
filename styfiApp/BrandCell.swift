//
//  BrandCell.swift
//  StyfiApp
//
//  Created by Sanjay Mali on 05/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit

class BrandCell: UITableViewCell {

    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var modifiedDate: UILabel!
    @IBOutlet weak var pcount: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var card: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
