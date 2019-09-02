//
//  PunchHealthDateCell.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/8/4.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchHealthDateCell: UICollectionViewCell {
        
    private let lineNumber = 6 // line number, month which first day is Saturday and has 31 days need biggest lines
    private let columnNumber = 7 // column number, a week
    private var buttonArr = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateDateButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var dateComponents: DateComponents? {
        willSet { updateButtons(with: newValue) }
    }
    
}

// MARK: - Subview
extension PunchHealthDateCell {
    
    // generate subviews
    private func generateDateButtons() {
        let buttonW = self.bounds.width / CGFloat(columnNumber)
        for line in 0..<lineNumber {
            for column in 0..<columnNumber {
                let buttonX = buttonW * CGFloat(column)
                let buttonY = buttonW * CGFloat(line)
                let button = PunchHealthDateButton(type: .custom)
                button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonW)
                button.setTitleColor(UIColor.darkGray, for: .normal)
                button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
                self.contentView.addSubview(button)
                buttonArr.append(button)
            }
        }
    }
    
    // update button's title and hidden
    private func updateButtons(with components: DateComponents?) {
        guard let comp = components else { return }
        let begin = DateHandler.beginIndex(with: comp)
        let days = DateHandler.monthDays(with: comp)
        for index in 0..<buttonArr.count {
            let button = buttonArr[index] as! PunchHealthDateButton
            if index < begin || index >= begin + days{
                button.setTitle("", for: .normal)
                button.isHidden = true
            } else {
                button.isHidden = false
                let day = index - begin + 1
                button.setTitle("\(day)", for: .normal)
                if comp.year == DateHandler.todayComponents.year &&
                    comp.month == DateHandler.todayComponents.month &&
                    day == DateHandler.todayComponents.day {
                    button.backColor = .red
                } else {
                    button.backColor = .white
                }
            }
        }
    }
    
    @objc private func buttonClicked(_ button: PunchHealthDateButton) {
        if button.backColor == nil || button.backColor == .white {
            button.backColor = .green
        } else if button.backColor == .green {
            button.backColor = .gray
        } else if button.backColor == .gray {
            button.backColor = .red
        } else if button.backColor == .red {
            button.backColor = .white
        }
    }
    
}
