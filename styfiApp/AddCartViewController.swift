//
//  AddCartViewController.swift
//  StyfiApp
//
//  Created by Sanjay Mali on 04/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit

class AddCartViewController: UIViewController {

    @IBOutlet weak var addCart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         appTitle()
         self.view.backgroundColor = UIColor.init(red: 235/255, green:235/255, blue: 235, alpha: 1.0)
    }
    func appTitle(){
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:view.frame.width - 32, height:view.frame.height))
        titleLabel.text = "CART"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        navigationItem.titleView = titleLabel
        self.view.backgroundColor = UIColor.init(red: 235/255, green:235/255, blue: 235, alpha: 1.0)
      
        self.addCart.layer.cornerRadius = 50
        self.addCart.layer.borderColor = UIColor.lightGray.cgColor
        self.addCart.layer.borderWidth = 3
        self.addCart.backgroundColor = UIColor.init(red: 50/255,green: 58/255,blue: 69/255,alpha: 1)
        self.addCart.layer.masksToBounds = true
        
    }

    @IBAction func addCart(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
