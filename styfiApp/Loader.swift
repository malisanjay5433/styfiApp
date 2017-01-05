//
//  ProgressIndicator.swift
//  PropRes
//
//  Created by Sanjay Mali on 05/01/17.
//  Copyright © 2016 Sanjay. All rights reserved.
//

import UIKit
import KRProgressHUD
class Loader: NSObject {
   
//   let appColor = UIColor,
    
   private static var __once: () = {
        Static.instance = Loader()
    }()
    
    struct Static {
        static var onceToken: Int = 0
        static var instance: Loader? = nil
    }
    class var inst: Loader {
        
        _ = Loader.__once
        return Static.instance!
    }

    func startLoading(){
        KRProgressHUD.show()
        KRProgressHUD.set(activityIndicatorStyle: .black)
    }
    
    func endLoading(){
        let delay = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: delay) {
            KRProgressHUD.dismiss()
        }
    }
    
    func mask(){
         KRProgressHUD.set(style: .white)
    }
    
}


