//
//  UIButton+Extension.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/11/22.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

extension UIButton {
    
    // 位置枚举
    enum ButtonImageTitlePosition {
        case imageTopTitleDown   // image在上，title在下
        case imageDownTitleTop   // image在下，title在上
        case imageLeftTitleRight // image在左，title在右
        case imageRightTitleLeft // image在右，title在左
    }
    
    // 重新设置 image 及 title 的位置及间距
    func resetImageTitlePosition(_ position: ButtonImageTitlePosition, space: CGFloat) {
        let imageWith = imageView?.frame.size.width ?? 0.0
        let imageHeight = imageView?.frame.size.height ?? 0.0
        
        var titleWidth: CGFloat
        var titleHeight: CGFloat
        if (UIDevice.current.systemVersion as NSString).floatValue >= 8.0 {
            // 由于iOS8中titleLabel的size为0，用下面的这种设置
            titleWidth = titleLabel?.intrinsicContentSize.width ?? 0.0
            titleHeight = titleLabel?.intrinsicContentSize.height ?? 0.0
        } else {
            titleWidth = titleLabel?.frame.size.width ?? 0.0
            titleHeight = titleLabel?.frame.size.height ?? 0.0
        }
        
        switch position {
        case .imageTopTitleDown:
            imageEdgeInsets = UIEdgeInsets(top: -titleHeight-space, left: 0, bottom: 0, right: -titleWidth)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space, right: 0)
        case .imageLeftTitleRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            titleEdgeInsets = UIEdgeInsets(top: 4, left: space/2.0, bottom: 0, right: -space/2.0)
        case .imageDownTitleTop:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -titleHeight-space, right: -titleWidth)
            titleEdgeInsets = UIEdgeInsets(top: -imageHeight-space, left: -imageWith, bottom: 0, right: 0)
        case .imageRightTitleLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth+space/2.0, bottom: 0, right: -titleWidth-space/2.0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0, bottom: 0, right: imageWith+space/2.0)
        }
    }
    
}

