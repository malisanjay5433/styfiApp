//
//  Brand_Info_Model.swift
//  styfiApp
//
//  Created by Sanjay Mali on 04/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import Foundation
import RealmSwift
class Brand_Info_Model:Object{
    dynamic var brand_Name = ""
    dynamic var brand_Description = ""
    dynamic var brand_Logo:NSData?
    dynamic var product_Count = ""
    dynamic var last_Modified_Date = ""
}
