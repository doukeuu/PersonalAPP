//
//  BaseViewController.swift
//  PersonalAPP
//
//  Created by panwei on 2019/6/24.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kColorBackground
        let backItem = UIBarButtonItem(title: "    ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    
    deinit {
        print("== \(self)")
    }
    
    // MARK: - Property
    
    /// 导航控制器
    var baseNavigation: BaseNavigationController {
        return self.navigationController as! BaseNavigationController
    }
    
    /// scrollView 顶部内容缩进
    var adjustScrollContentInsets: Bool = true {
        willSet {
            if #available(iOS 11.0, *) {
                UIScrollView.appearance().contentInsetAdjustmentBehavior = newValue ? .automatic : .never
            } else {
                self.automaticallyAdjustsScrollViewInsets = newValue
            }
        }
    }
    
    /// 导航栏背景色、标题色
    func configNavigationBackColor(_ backColor: UIColor?, titleColor: UIColor?) {
        let bar = self.navigationController?.navigationBar
        if backColor != nil {
            bar?.shadowImage = UIImage.imageWithColor(backColor!)
            baseNavigation.effectView.contentView.backgroundColor = backColor!
        } else {
            bar?.shadowImage = UIImage.imageWithColor(kColorSeparation)
            baseNavigation.effectView.contentView.backgroundColor = kColorBackground.withAlphaComponent(0.9)
        }
        if titleColor != nil {
            bar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor!]
        } else {
            bar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: kColorBlack]
        }
    }
    
}
