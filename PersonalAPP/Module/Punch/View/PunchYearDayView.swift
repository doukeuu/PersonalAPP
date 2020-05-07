//
//  PunchYearDayView.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/9/8.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchYearDayView: UIView {

    private let circleLayer: CALayer = CALayer() // circle background layer
    private let dayLabel: UILabel = UILabel()    // day label
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func generateSubview() {
        let circleRect = self.bounds.insetBy(dx: 10, dy: 10)
        circleLayer.frame = circleRect
        circleLayer.cornerRadius = circleRect.width / 2
        circleLayer.borderWidth = 1
        circleLayer.borderColor = UIColor.lightGray.cgColor
        circleLayer.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(circleLayer)
        
        dayLabel.frame = circleRect
        dayLabel.textColor = .lightGray
        dayLabel.textAlignment = .center
        dayLabel.numberOfLines = 2
        self.addSubview(dayLabel)
    }
    
    var text: String? {
        didSet { dayLabel.text = text }
    }
    
    enum StateColor: Int {
        case today
        case white
        case green
        case gray
        case red
    }
    
    var backColor: StateColor? {
        didSet {
            guard let color = backColor else { return }
            switch color {
            case .today:
                circleLayer.backgroundColor = UIColor.orange.cgColor
                circleLayer.borderColor = UIColor.orange.cgColor
            case .white:
                circleLayer.backgroundColor = UIColor.white.cgColor
                circleLayer.borderColor = UIColor.lightGray.cgColor
            case .green:
                circleLayer.backgroundColor = UIColor.green.cgColor
                circleLayer.borderColor = UIColor.green.cgColor
            case .gray:
                circleLayer.backgroundColor = UIColor.lightGray.cgColor
                circleLayer.borderColor = UIColor.lightGray.cgColor
            case .red:
                circleLayer.backgroundColor = UIColor.red.cgColor
                circleLayer.borderColor = UIColor.red.cgColor
            }
            dayLabel.textColor = color != .white ? UIColor.white : UIColor.lightGray
        }
    }

}
