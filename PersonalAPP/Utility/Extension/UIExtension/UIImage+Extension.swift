//
//  UIImage+Extension.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/11/22.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage {
    
    /// 生成纯色图片
    static func imageWithColor(_ color: UIColor = UIColor.white, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
