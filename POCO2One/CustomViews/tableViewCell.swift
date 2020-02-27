//
//  tableViewCell.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    @IBOutlet weak var popularViewImage: UIImageView!
    
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var photo:Photos? {
        didSet {
            guard let phto = photo else {return}
            if let name = phto.name {
                nameLbl.text = name
            }
            if let rating = phto.rating {
                ratingLbl.text = "Rating : \(rating) "
            }

            if let url = phto.image_url{
                popularViewImage.imageFromServerURL(urlString: url[0])
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
