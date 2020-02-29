//
//  MainVC.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import UIKit
import CoreData
class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView() // view
    var viewModel : MainVM?
    var photos:[Photos]?
    var coreDataPhoto:[Photo]?
    typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Home"
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        viewModel = MainVM()
        viewModel?.getPopularPhotos(completionHandler: { (response) in
            if response == nil
            {
                // failed
                
            }
            else
            {
                // success
                
                if let photos = response?.photos{
                    self.savePhotosToCoreData(photos:photos)
                    self.printData()
                }
                
            }
        })
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "tableViewCell", bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: "tableViewCell")
    }
    
    
    func savePhotosToCoreData(photos:[Photos]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Photo", in: managedContext) else{return}
        
        for item in photos {
            let photo = Photo(entity: entity, insertInto: managedContext)
            photo.name = item.name
            photo.descri = item.description
            photo.imageUrl = item.image_url?.first
            photo.location = item.location
            photo.camera = item.camera
            photo.lens = item.lens
            photo.rating = item.rating ?? 0.0
            if let user = item.user{
                photo.userName = user.username
                photo.userAbout = user.about
                photo.userImageUrl = user.avatars?.large?.https
                
            }
            if let lat = item.latitude {
                photo.latitude = lat
            }
            if let long = item.longitude {
                photo.latitude = long
            }
            if let rating = item.rating {
                photo.latitude = rating
            }
        }
        
    }
    
    func printData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        
        do{
            let photos = try managedContext.fetch(fetchRequest) as? [Photo]
            // sort the photos on basis of rating
            self.coreDataPhoto = photos!.sorted(by: {$0.rating > $1.rating})
            self.tableView.reloadData()

        }catch{
            print("some thing went wrong")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataPhoto?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! tableViewCell
        cell.pos = indexPath.row
        cell.phto  = coreDataPhoto?[indexPath.row]
        cell.alpha = 0
        
        let animation = makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.1, delayFactor: 0.01)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC : DetailsVC = DetailsVC.init(nibName: "DetailsView", bundle: nil)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        
        do{
            coreDataPhoto = try managedContext.fetch(fetchRequest) as? [Photo]
        }catch{
            print("some thing went wrong")
        }
        detailsVC.photo = coreDataPhoto![indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func makeMoveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, _ in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
            cell.alpha = 0
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
        }
    }
    
}

