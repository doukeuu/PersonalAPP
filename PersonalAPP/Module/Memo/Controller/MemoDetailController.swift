//
//  MemoDetailController.swift
//  PersonalAPP
//
//  Created by panwei on 2019/6/24.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class MemoDetailController: BaseViewController {

    /// Text Container
    var textView: UITextView!
    /// Display Time
    var timeButton: UIButton!
    
    // scrollView contentOffset.y begin dragging
    var lastOffsetY: CGFloat = 0.0
    // dragging orientation, -1 down, 1 up, 0 stop
    var scrollOrientation: NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isTranslucent = false
        generateSubview()
    }

}

// MARK: - UI
extension MemoDetailController {
    
    private func generateSubview() {
        textView = UITextView(frame: self.view.bounds)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = UIColor.darkGray
        textView.delegate = self
        self.view.addSubview(textView)
        
        timeButton = UIButton(type: .custom)
        timeButton.frame = CGRect(x: 0, y: -20, width: textView.bounds.width, height: 20)
        timeButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        timeButton.setTitleColor(UIColor.lightGray, for: .normal)
        timeButton.setTitle("创建于2019年6月24日下午3点20份", for: .normal)
        textView.addSubview(timeButton)
    }
}

extension MemoDetailController: UITextViewDelegate {
    
}

extension MemoDetailController: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastOffsetY = scrollView.contentOffset.y
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let endOffsetY = scrollView.contentOffset.y
        if lastOffsetY < endOffsetY { // up
            scrollOrientation = 1
        } else if lastOffsetY > endOffsetY { // down
            scrollOrientation = -1
        } else {
            scrollOrientation = 0
        }
        if scrollOrientation == 1 {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if scrollOrientation == -1 {
            scrollView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        }
    }
}
