//
//  ViewController.swift
//  styfiApp
//
//  Created by Sanjay Mali on 04/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit
import RealmSwift
import AlamofireImage

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource:Results<Brand_Info_Model>!
    override func viewDidLoad() {
        super.viewDidLoad()
        appTitle()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsetsMake(8, 0, 8, 0)
        self.tableView.separatorStyle = .none
        reloadTable()
    }
    
    func appTitle(){
        
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:view.frame.width - 32, height:view.frame.height))
        titleLabel.text = "STYFI"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        navigationItem.titleView = titleLabel
        self.view.backgroundColor = UIColor.init(red: 235/255, green:235/255, blue: 235, alpha: 1.0)
    }
    
    
    @IBAction func addCart(_ sender: Any) {
        performSegue(withIdentifier: "AddVC", sender:nil)
        
    }
    func reloadTable(){
        let realm = try! Realm()
        dataSource = realm.objects(Brand_Info_Model.self)
        self.tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadTable()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BrandCell
        let shadowPath = UIBezierPath(rect: cell.card.layer.bounds)
        cell.card.layer.masksToBounds = false
        cell.card.layer.shadowColor = UIColor.lightGray.cgColor
        cell.card.layer.shadowOffset = CGSize(width: 2, height: 2.5)
        cell.card.layer.shadowOpacity = 0.2
        cell.card.layer.shadowPath = shadowPath.cgPath
        cell.card.layer.cornerRadius = 3.0//
        cell.logo.layer.cornerRadius = 60
        cell.logo.layer.masksToBounds = true
        cell.logo.layer.borderColor = UIColor.white.cgColor
        cell.logo.layer.borderWidth  = 2.0
        let data = dataSource[indexPath.row]
        cell.brandName.text = data.brand_Name
        cell.desc.text = data.brand_Description
         let logo = UIImage(data:data.brand_Logo as! Data)
//        if logo == nil{
//            cell.logo.image = UIImage(named:"add-logo")
//        }
        let imageCache = AutoPurgingImageCache()
        let avatarImage = UIImage(data:data.brand_Logo as! Data)
        
        // Add
        imageCache.add(avatarImage!, withIdentifier: "add-logo")
        
        // Fetch
        let cachedAvatar = imageCache.image(withIdentifier: "add-logo")
        cell.logo.image = cachedAvatar

        // Remove
//        imageCache.removeImage(withIdentifier: "add-logo")
        cell.logo.image = logo
        cell.modifiedDate.text  = data.last_Modified_Date
        cell.pcount.text = data.product_Count
        return cell
    }
}

