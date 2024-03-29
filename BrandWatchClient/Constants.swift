//
//  Constants.swift
//  BrandWatchClient
//
//  Created by Niaz Jalal on 10/25/14.
//  Copyright (c) 2014 BrandWatch. All rights reserved.
//

import Foundation

// Fonts
let fBWGillsManBold16 = UIFont(name: "GillSans-Bold", size: 16)
let fBWGillsManBold12 = UIFont(name: "GillSans-Bold", size: 12)
let fBWGillsManBold10 = UIFont(name: "GillSans-Bold", size: 10)
let fBWMenloBold14 = UIFont(name: "Menlo-Bold", size: 14)
let fBWMenloBold15 = UIFont(name: "Menlo-Bold", size: 15)
let fBWMenloBold16 = UIFont(name: "Menlo-Bold", size: 16)
let fBWMenloBold18 = UIFont(name: "Menlo-Bold", size: 18)

// Colors

extension UIColor {

    //#7D1935 BWRed
    //#4A96AD BWDarkBlue
    //#F5F3EE BWOffWhite
    //#FFFFFF BWWhite
    //#33CC33 BWGreen
    //#A2A2A2 BWGray
    //#FFC6FF BWPink
    
    class func BWRed() -> UIColor {
    
        return UIColor(red: 125.0/255.0, green: 25.0/255.0, blue: 53.0/255.0, alpha: 1.0)
    }
    
    class func BWOffWhite() -> UIColor {
        
        return UIColor(red: 245.0/255.0, green: 243.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }
    
    class func BWBlue() -> UIColor {
        
        return UIColor(red: 74.0/255.0, green: 150.0/255.0, blue: 173.0/255.0, alpha: 1.0)
    }
    
    class func BWWhite() -> UIColor {
        
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    class func BWDarkBlue() -> UIColor {
        
        return UIColor(red: 45.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    }
    
    class func BWGreen() -> UIColor {
        
        return UIColor(red: 51.0/255.0, green: 204.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    }
    
    class func BWGray() -> UIColor {
        
        return UIColor(red: 162.0/255.0, green: 162.0/255.0, blue: 162.0/255.0, alpha: 1.0)
    }
    
    class func BWPink() -> UIColor {
        
        return UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    class func BWRedAlpha() -> UIColor {
        
        return UIColor(red: 125.0/255.0, green: 25.0/255.0, blue: 53.0/255.0, alpha: 0.5)

//        return UIColor(hue: 343, saturation: 0.66, brightness: 0.3, alpha: 0.5)
    }
    class func BWDarkBlueAlpha() -> UIColor {
        
        return UIColor(red: 45.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 0.5)

//        return UIColor(hue: 211, saturation: 0.28, brightness: 0.24, alpha: 0.5)
    }
}

