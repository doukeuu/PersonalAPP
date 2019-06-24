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
        textView.textContainerInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        self.view.addSubview(textView)
        
        timeButton = UIButton(type: .custom)
        timeButton.frame = CGRect(x: 0, y: 0, width: textView.bounds.width, height: 20)
        timeButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        timeButton.setTitleColor(UIColor.lightGray, for: .normal)
        timeButton.setTitle("创建于2019年6月24日下午3点20份", for: .normal)
        textView.addSubview(timeButton)
        
    }
    
}
