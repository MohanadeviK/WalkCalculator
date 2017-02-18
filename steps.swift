//
//  steps.swift
//  Example
//
//  Created by Devi on 18/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import ObjectMapper

class steps: Mappable
{
    
    var time : String?
    var no_of_steps : Int?
    
    
    // MARK: Init Method
    
    required init?(map: Map)
    {
        mapping(map: map)
        
    }
    
    func mapping(map: Map)
    {
        time  <- map["time"]
        no_of_steps  <- map["no_of_steps"]
        
    }

}
