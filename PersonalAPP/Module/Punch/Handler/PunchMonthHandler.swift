//
//  PunchMonthHandler.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/10/20.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchMonthHandler {
    
    private var days = 30  // day number of a month
    private var begin = 0  // first day index
    private var weeks = 4  // week number of a month
    
    var monthDeviation: Int = Int.max {
        didSet {
            if monthDeviation == oldValue { return }
            let components = DateHandler.componentsWithMonthDeviation(monthDeviation)
            updateProperties(with: components)
        }
    }
    
    private func updateProperties(with components: DateComponents) {
        days = DateHandler.monthDays(with: components)
        begin = components.weekday != nil ? components.weekday! - 1 : 0
        weeks = (days + begin) / 7
        if (days + begin) % 7 > 0 { weeks += 1 }
    }
    
}

extension PunchMonthHandler {
    
    var itemNumber: Int { return weeks * 7 }
    
    func dayNumber(at item: Int) -> String {
        // change item number from vertical to horizontal
        var reviseItem = item / weeks + item % weeks * 7
        reviseItem -= begin
        if reviseItem < 0 || reviseItem >= days {
            return ""
        } else {
            return "\(reviseItem + 1)"
        }
    }
    
    func itemSpacing(with height: CGFloat) -> CGFloat {
        return (height - (height / 6.0) * CGFloat(weeks)) / CGFloat(weeks + 1)
    }
    
    class func cellSize(with viewSize: CGSize) -> CGSize {
        return CGSize(width: viewSize.width / 7, height: viewSize.height / 6)
    }
    
}
