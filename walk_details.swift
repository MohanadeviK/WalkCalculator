//
//  steps_details.swift
//  Example
//
//  Created by Devi on 18/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import ObjectMapper

class walk_details : Mappable
{
    var steps_details : Array<steps_details>?
    
    // MARK: Init Method
    
    required init?(map: Map)
    {
        mapping(map: map)
        
    }
    
    func mapping(map: Map)
    {
        
        steps_details  <- map["steps_details"]
    }

}
