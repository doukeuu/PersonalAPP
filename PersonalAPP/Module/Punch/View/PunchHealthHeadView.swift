//
//  PunchHealthHeadView.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/8/3.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchHealthHeadView: UIView {

    var countLabel: UILabel! // day count
    private var dayLabel: UILabel! // day
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ownConfiguration()
        generateSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Subview
extension PunchHealthHeadView {
    
    // configuration itself
    private func ownConfiguration() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    // Generate subviews
    private func generateSubview() {
        // day count
        var frame = CGRect(x: 0, y: 36, width: 20, height: 42)
        countLabel = UILabel(frame: frame)
        countLabel.font = UIFont.systemFont(ofSize: 48)
        countLabel.textColor = UIColor.green
        countLabel.textAlignment = .center
        self.addSubview(countLabel)
        
        // day
        frame = CGRect(x: 0, y: countLabel.frame.maxY - 24, width: 20, height: 20)
        dayLabel = UILabel(frame: frame)
        dayLabel.layer.cornerRadius = 10;
        dayLabel.layer.masksToBounds = true
        dayLabel.backgroundColor = UIColor.orange
        dayLabel.font = UIFont.systemFont(ofSize: 14)
        dayLabel.textColor = UIColor.white
        dayLabel.textAlignment = .center
        dayLabel.text = "天"
        self.addSubview(dayLabel)
        
        // week names with equal spacing
        let weekArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        let weekCount = CGFloat(weekArray.count)
        let weekWidth = self.bounds.width / weekCount - 1
        let spacing = weekCount / (weekCount - 1)
        frame = CGRect(x: 0, y: self.bounds.height - 36, width: weekWidth, height: 36)
        
        for weekName in weekArray {
            let label = UILabel(frame: frame)
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.gray
            label.textAlignment = .center
            label.text = weekName
            self.addSubview(label)
            frame.origin.x = frame.maxX + spacing;
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let countW = countLabel.intrinsicContentSize.width
        let dayW = dayLabel.intrinsicContentSize.width
        let halfW = (countW + dayW) / 2
        countLabel.frame.origin.x = self.center.x - halfW
        countLabel.frame.size.width = countW
        dayLabel.frame.origin.x = countLabel.frame.maxX + 2
    }
}
