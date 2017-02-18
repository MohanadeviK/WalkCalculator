//
//  WalkDetails.swift
//  Example
//
//  Created by Devi on 18/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import ObjectMapper

class Walk : Mappable
{
    var walk_details : walk_details?
    
    // MARK: Init Method
    
    required init?(map: Map)
    {
        mapping(map: map)
        
    }
    
    func mapping(map: Map)
    {
        
        walk_details  <- map["walk_details"]
    }
}
