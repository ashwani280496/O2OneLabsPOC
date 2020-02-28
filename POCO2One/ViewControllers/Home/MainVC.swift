//
//  MainVC.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let contactsTableView = UITableView() // view
    var viewModel : MainVM?
    var photos:[Photos]?
    typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Home"
        view.addSubview(contactsTableView)
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.contactsTableView.dataSource = self
        self.contactsTableView.delegate = self
        
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
                    // sorting photos on basis on rating
                    self.photos = photos.sorted(by: {$0.rating! > $1.rating!})
                    self.contactsTableView.reloadData()
                }
                
            }
        })
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "tableViewCell", bundle: bundle)
        contactsTableView.register(nib, forCellReuseIdentifier: "tableViewCell")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! tableViewCell
        cell.photo  = photos![indexPath.row]
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
        detailsVC.photo = photos![indexPath.row]
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

