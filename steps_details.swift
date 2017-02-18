//
//  Steps.swift
//  Example
//
//  Created by Devi on 18/02/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit
import ObjectMapper

class steps_details: Mappable
{
    var date : String?
    var steps : Array<steps>?
    
    
    // MARK: Init Method
    
    required init?(map: Map)
    {
        mapping(map: map)
        
    }
    
    func mapping(map: Map)
    {
        date  <- map["date"]
        steps  <- map["steps"]
        
    }

}
