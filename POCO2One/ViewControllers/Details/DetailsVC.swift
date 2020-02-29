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
    @IBOutlet weak var mapView: UIImageView!
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var lensDetailLbl: UILabel!
    var viewModel : DetailsVM?
    var photo:Photo?
    
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
        if let description = phto.descri {
            descriptionLbl.text = description
        }
        if let userName = phto.userAbout {
            userNameLbl.text = userName
        }
        if let userAbout = phto.userName {
            userAboutLbl.text = userAbout
        }
        
        if let camera = phto.camera {
            cameraDetailLbl.text = camera
        }
        if let lens = phto.lens {
            lensDetailLbl.text = lens
        }
        
        if let location = phto.location {
            locationLbl.isHidden = false
            locationLbl.text = location
        }else {
            locationLbl.isHidden = true
        }
        if let location = photo?.location{
            locationLbl.isHidden = false
            locationLbl.text = location
        } else {
            locationLbl.isHidden = true
            
        }
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        
        // Set the region of the map that is rendered.
        let location = CLLocationCoordinate2DMake(28.6139, 77.2090)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapSnapshotOptions.region = region
        
        // Set the scale of the image. We'll just use the scale of the current device, which is 2x scale on Retina screens.
        mapSnapshotOptions.scale = UIScreen.main.scale
        
        // Set the size of the image output.
        mapSnapshotOptions.size = CGSize(width:300, height:300)
        
        // Show buildings and Points of Interest on the snapshot
        mapSnapshotOptions.showsBuildings = true
        mapSnapshotOptions.showsPointsOfInterest = true
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        snapShotter.start { [weak self]  (snapshot, error)in
            if let image = snapshot?.image {
                self?.mapView.image = image
            }
        }
        
    if let url = phto.userImageUrl{
                    userImageView.imageFromServerURL(urlString: url)
                }
        
        
        
    }
    
    /**
     open the Map view for the lat long
     */
    
    @IBAction func locationBtnAction(_ sender: Any) {
        guard let phto = photo else {return}
        
        let latitude: CLLocationDegrees = 37.2
        let longitude: CLLocationDegrees = 22.9
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
        source.name = "Source"
        
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: phto.latitude, longitude: phto.longitude)))
        destination.name = "Destination"
        
        MKMapItem.openMaps(with: [source, destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
        
    }
}
