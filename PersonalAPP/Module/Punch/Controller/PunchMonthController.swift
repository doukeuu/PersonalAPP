//
//  PunchMonthController.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/9/9.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchMonthController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateSubviews()
    
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let barButton = self.navigationController?.navigationBar.subviews.last?.subviews.first else {
            return
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickBackButton))
        barButton.addGestureRecognizer(tap)
    
        
    }
    @objc private func clickBackButton() {
        print("afsdfadsfasdf")
        self.navigationController?.popViewController(animated: true)
    }

    
}



// MARK: - Subviews
extension PunchMonthController {
    
    private func generateSubviews() {
        let rect = CGRect(x: 0, y: kNavigatorHeight, width: kScreenWidth, height: 300)
        let recordVieww = PunchMonthRecordView(frame: rect)
        self.view.addSubview(recordVieww)
    }
    
}
