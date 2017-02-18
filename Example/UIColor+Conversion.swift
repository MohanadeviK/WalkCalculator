//
//  UIColor+Conversion.swift
//  TweetStorm
//
//  Created by Saravana on 01/07/16.
//  Copyright © 2016 Effect Works. All rights reserved.
//

import UIKit

// To change the HexaDecimal value to Corresponding Color

extension UIColor
{
    class func uicolorFromHex(_ rgbValue:UInt32, alpha : CGFloat)->UIColor
        
    {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0xFF) / 255.0
        return UIColor(red:red, green:green, blue:blue, alpha: alpha)
    }

    
}
