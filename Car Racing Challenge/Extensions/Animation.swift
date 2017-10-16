//
//  Animation.swift
//  Car Racing Challenge
//
//  Created by Dennis Du on 01/10/17.
//  Copyright (c) 2017 Dennis Du. All rights reserved.
//

import Foundation

struct AnimationTime
{
    /** 1.00 sec */
    static var VerySlow : TimeInterval = 1.00;
    /** 0.50 secs */
    static var Slow     : TimeInterval = 0.50;
    /** 0.30 secs */
    static var Default  : TimeInterval = 0.30;//0.30
    /** 0.25 secs */
    static var Fast     : TimeInterval = 0.25;
    /** 0.20 secs */
    static var VeryFast : TimeInterval = 0.20;
}

enum AnimationStyle:Int
{
    case scale     = 1
    case slideUp   = 2
};
