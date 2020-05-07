//
//  PunchYearDateView.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/9/7.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchYearDateView: UICollectionReusableView {
    
    private let columnNumber: CGFloat = 7.0 // column number, a week
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        label.textColor = .black
        label.frame = CGRect(x: 0, y: 0, width: 100, height: self.bounds.height)
        self.addSubview(label)
        return label
    }()
    
    private lazy var lineView: UIView = {
        let line = UIView(frame: CGRect(x: 0, y: self.bounds.height - 1, width: 0, height: 1))
        line.backgroundColor = UIColor.lightGray
        self.addSubview(line)
        return line
    }()
    
    public var components: DateComponents? {
        willSet {
            if newValue == nil { return }
            titleLabel.text = "\(newValue!.month!)月"
            if newValue!.year == DateHandler.todayComponents.year &&
                newValue!.month == DateHandler.todayComponents.month {
                titleLabel.textColor = .orange
            } else {
                titleLabel.textColor = .black
            }
            let labelW = self.bounds.width / columnNumber
            let labelX = labelW * CGFloat(newValue!.weekday! - 1) + 10
            titleLabel.frame.origin.x = labelX
            lineView.frame.origin.x = labelX
            lineView.frame.size.width = self.bounds.width - labelX
        }
    }
    
}
