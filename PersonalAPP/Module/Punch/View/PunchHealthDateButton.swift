//
//  PunchHealthDateButton.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/8/31.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchHealthDateButton: UIButton {

    enum StateColor: Int {
        case white
        case green
        case gray
        case red
    }

    private lazy var lineLayer: CALayer = {
        let lineLayer = CALayer()
        lineLayer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(lineLayer)
        return lineLayer
    }()
    
    private lazy var circleLayer: CALayer = {
        let layer = CALayer()
        self.layer.addSublayer(layer)
        return layer
    }()
    
    override var frame: CGRect {
        didSet {
            if frame == .zero { return }
            let circleRect = CGRect(origin: .zero, size: frame.size)
            let pathRect = circleRect.insetBy(dx: 10, dy: 10)
            
            lineLayer.frame.size = CGSize(width: circleRect.width, height: 0.6)
            circleLayer.frame = pathRect
            circleLayer.cornerRadius = pathRect.width / 2
        }
    }
    
    var backColor: StateColor? {
        didSet {
            guard let color = backColor else { return }
            switch color {
            case .white: circleLayer.backgroundColor = UIColor.white.cgColor
            case .green: circleLayer.backgroundColor = UIColor.green.cgColor
            case .gray:  circleLayer.backgroundColor = UIColor.lightGray.cgColor
            case .red:   circleLayer.backgroundColor = UIColor.red.cgColor
            }
            if color != .white {
                self.setTitleColor(.white, for: .normal)
            } else {
                self.setTitleColor(.darkGray, for: .normal)
            }
        }
    }

    
}
