//
//  Fonts.swift
//  Car Racing Challenge
//
//  Created by Dennis Du on 01/10/17.
//  Copyright (c) 2017 Dennis Du. All rights reserved.
//

import Foundation
import UIKit

class Fonts
{
    static func DefaultFont(_ size:CGFloat) -> UIFont!
    {
        return UIFont(name: FontNames.Default, size: size)!;
    }
    
    static func BoldFont(_ size:CGFloat) -> UIFont!
    {
        return UIFont(name: FontNames.Bold, size: size)!;
    }
    
    static func LightFont(_ size:CGFloat) -> UIFont!
    {
        return UIFont(name: FontNames.Light, size: size)!;
    }
}

struct FontNames
{
    static var Light    : String = "ARMOUR-Bold";
    static var Default  : String = "ARMOUR-Bold";
    static var Bold     : String = "ARMOUR-Bold";
}

struct FontSize
{
    /**
    8px
    */
    static var Tiny        : CGFloat = 10;
    /**
    15px
    */
    static var Small        : CGFloat = 13;
    /** 
    20px 
    */
    static var Default     : CGFloat = 20;
    /** 
    30px 
    */
    static var Medium      : CGFloat = 30;
    /** 
    40px 
    */
    static var Big         : CGFloat = 30;
}
