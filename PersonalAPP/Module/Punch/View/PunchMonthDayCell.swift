//
//  PunchMonthDayCell.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/9/22.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchMonthDayCell: UICollectionViewCell {
    
    private(set) var dayLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var text: String? {
        didSet {
            dayLabel.text = text
            dayLabel.isHidden = text?.isEmpty ?? true
//            let currentText = "\(DateHandler.todayComponents.day ?? 0)"
//            if text > currentText {
//                
//            }
        }
    }
    
}

extension PunchMonthDayCell {
    
    private func generateSubview() {
        let width = self.bounds.height - 8
        let x = (self.bounds.width - width) / 2
        let circleRect = CGRect(x: x, y: 4, width: width, height: width)
        
        dayLabel.frame = circleRect
        dayLabel.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        dayLabel.layer.borderWidth = 1
        dayLabel.layer.cornerRadius = (self.bounds.height - 8) / 2
        dayLabel.layer.masksToBounds = true
        dayLabel.layer.borderColor = UIColor.orange.cgColor
        dayLabel.font = UIFont.systemFont(ofSize: 15)
        dayLabel.textColor = .darkGray
        dayLabel.textAlignment = .center
        self.contentView.addSubview(dayLabel)
    }
    
}
