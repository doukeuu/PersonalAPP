//
//  PunchYearDateCell.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/9/7.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchYearDateCell: UICollectionViewCell {
    
    private let lineNumber = 6         // line number, a month need biggest lines
    private let columnNumber = 7       // column number, a week
    private var viewArray = [UIView]() // all day view array
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateDayViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var dateComponents: DateComponents? {
        willSet { updateDays(with: newValue) }
    }
    
}

extension PunchYearDateCell {
    
    // generate subviews
    private func generateDayViews() {
        let dayW = self.bounds.width / CGFloat(columnNumber)
        for line in 0..<lineNumber {
            for column in 0..<columnNumber {
                let dayX = dayW * CGFloat(column)
                let dayY = dayW * CGFloat(line)
                let rect = CGRect(x: dayX, y: dayY, width: dayW, height: dayW)
                let dayView = PunchYearDayView(frame: rect)
                self.contentView.addSubview(dayView)
                viewArray.append(dayView)
            }
        }
    }
    
    // update button's title and hidden
    private func updateDays(with components: DateComponents?) {
        guard let comp = components else { return }
        let begin = DateHandler.beginIndex(with: comp)
        let days = DateHandler.monthDays(with: comp)
        for index in 0..<viewArray.count {
            let dayView = viewArray[index] as! PunchYearDayView
            if index >= begin && index < begin + days {
                dayView.isHidden = false
                let day = index - begin + 1
                dayView.text = "\(day)"
                if comp.year == DateHandler.todayComponents.year &&
                    comp.month == DateHandler.todayComponents.month &&
                    day == DateHandler.todayComponents.day {
                    dayView.backColor = .today
                } else {
                    dayView.backColor = .white
                }
            } else {
                dayView.text = ""
                dayView.isHidden = true
            }
        }
    }
    
}
