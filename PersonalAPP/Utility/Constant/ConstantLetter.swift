//
//  ConstantLetter.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/8/18.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

// Screen Rect
let screenBounds = UIScreen.main.bounds
let screenWidth  = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let screenRatio  = screenWidth / 375.0
// status Height
let statusHeight = UIApplication.shared.statusBarFrame.height
// navigator height
let navigatorHeight = statusHeight + 44.0
// tabBar height
let tabBarHeight = bottomSafeArea + 49.0
// bottom safe area height
let bottomSafeArea: CGFloat  = statusHeight > 20.0 ? 34.0 : 0.0


