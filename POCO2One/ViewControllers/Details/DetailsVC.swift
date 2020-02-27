//
//  DetailsVC.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import UIKit
import MapKit
class DetailsVC: UIViewController{
    @IBOutlet weak var imageNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userAboutLbl: UILabel!
    @IBOutlet weak var cameraDetailLbl: UILabel!
    @IBOutlet weak var locationBtn: UIButton!
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var lensDetailLbl: UILabel!
    var viewModel : DetailsVM?
    var photo:Photos?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Datils"
        
        userImageView.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        userImageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        userImageView.layer.cornerRadius = 35
        userImageView.clipsToBounds = true
        
        guard let phto = photo else {return}
        if let name = phto.name {
            imageNameLbl.text = name
        }
        if let description = phto.description {
            descriptionLbl.text = description
        }
        if let userName = phto.user?.username {
            userNameLbl.text = userName
        }
        if let userAbout = phto.user?.about {
            userAboutLbl.text = userAbout
        }
        
        if let camera = phto.camera {
            cameraDetailLbl.text = camera
        }
        if let lens = phto.lens {
            lensDetailLbl.text = lens
        }
        
        if phto.latitude != nil {
            locationBtn.isHidden = false
            if let location = photo?.location{
                locationLbl.isHidden = false
                locationLbl.text = location
            } else {
                locationLbl.isHidden = true

            }

        }else {
            locationBtn.isHidden = true
            locationLbl.isHidden = false

        }
        
        if let url = phto.user?.avatars?.large?.https{
            userImageView.imageFromServerURL(urlString: url)
        }
        
        
       
    }
    
    /**
     open the Map view for the lat long
     */

    @IBAction func locationBtnAction(_ sender: Any) {
        guard let phto = photo else {return}

        guard let lat = phto.latitude else {
        return
        }
        guard let lng = phto.latitude else {
        return
        }

        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng)))
        source.name = "Source"

        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng)))
        destination.name = "Destination"

        MKMapItem.openMaps(with: [source, destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
}
