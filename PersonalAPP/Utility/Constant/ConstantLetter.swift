//
//  ConstantLetter.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/8/18.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

// Screen Rect
let kScreenBounds = UIScreen.main.bounds
let kScreenWidth  = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kScreenRatio  = kScreenWidth / 375.0
// status Height
let kStatusHeight = UIApplication.shared.statusBarFrame.height
// navigator height
let kNavigatorHeight = kStatusHeight + 44.0
// tabBar height
let kTabBarHeight = kBottomSafeArea + 49.0
// bottom safe area height
let kBottomSafeArea: CGFloat  = kStatusHeight > 20.0 ? 34.0 : 0.0

// Colors
let kColorBlack      = UIColor(hexString: "#333333") // black
let kColorRed        = UIColor(hexString: "#fe4f65") // red
let kColorGray       = UIColor(hexString: "#666666") // gray
let kColorOrange     = UIColor(hexString: "#ed9121") // orange
let kColorLightGray  = UIColor(hexString: "#999999") // light gray
let kColorBackground = UIColor(hexString: "#f5f5f5") // background color
let kColorSeparation = UIColor(hexString: "#e5e5e5") // separation color
let kColorDisabled   = UIColor(hexString: "#b3bfd0") // disabled color
