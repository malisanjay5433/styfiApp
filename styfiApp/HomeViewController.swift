//
//  ViewController.swift
//  styfiApp
//
//  Created by Sanjay Mali on 04/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        appTitle()
    }
    
    func appTitle(){
       let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:view.frame.width - 32, height:view.frame.height))
        titleLabel.text = "STYFI"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        navigationItem.titleView = titleLabel
        self.view.backgroundColor = UIColor.init(red: 235/255, green:235/255, blue: 235, alpha: 1.0)
        
    }
    @IBAction func prepareForWind(segue:UIStoryboardSegue){
        
    }
    
}

