//
//  tableViewCell.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import UIKit
import CoreData

class tableViewCell: UITableViewCell {
    @IBOutlet weak var popularViewImage: UIImageView!
    
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    var pos:Int!
    
    var phto:Photo? {
        didSet {
            if let name = phto?.name {
                nameLbl.text = name
            }
            ratingLbl.text = "Rating : \(phto!.rating) "
            
            
            if let imagedata = phto?.image {
                if let image = UIImage(data:imagedata) {
                    popularViewImage.image = image
                }
            } else {
                if let url = phto?.imageUrl{
                    
                    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
                    let managedContext = appDelegate.persistentContainer.viewContext
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
                    do{
                        let coreDataPhoto = try managedContext.fetch(fetchRequest) as? [Photo]
                        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
                            if error != nil {
                                return
                            }
                            DispatchQueue.main.async(execute: { () -> Void in
                                let image = UIImage(data: data!)
                                self.popularViewImage.image = image
                                coreDataPhoto![self.pos].image = data // saving imageData in core Data
                            })
                            
                        }).resume()
                    }catch{
                        print("some thing went wrong")
                    }
                    
                }
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
