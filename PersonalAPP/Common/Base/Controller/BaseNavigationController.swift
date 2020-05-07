//
//  BaseNavigationController.swift
//  PersonalAPP
//
//  Created by panwei on 2019/6/24.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    private var _effectView: UIVisualEffectView! // 模糊视图
    private var _navigatorLine: UIView?     // 分割线视图
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self;
        configNavigationBar()
        generateEffectView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addVisualEffectViewToBar()
    }
    
    // 状态栏颜色设置的一部分
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    /// 模糊视图
    var effectView: UIVisualEffectView {
        return _effectView
    }
    
    /// 分割线
    var navigationLine: UIView? {
        if _navigatorLine == nil {
            lookupNavigatorLine()
        }
        return _navigatorLine
    }
    
    /// 侧滑手势响应开关，最好在viewDidAppear中
    var isPopGestureEnabled: Bool = true
    
}

// MARK: - Subviews & Style
extension BaseNavigationController {
    
    // 导航栏背景及字体样式
    private func configNavigationBar() {
        let backImage = UIImage.imageWithColor(UIColor.clear)
        self.navigationBar.setBackgroundImage(backImage, for: .default)
        self.navigationBar.shadowImage = UIImage.imageWithColor(kColorSeparation)
        
        let indicatorImage = UIImage(named: "arrow_back_black")?.withRenderingMode(.alwaysOriginal)
        self.navigationBar.backIndicatorImage = indicatorImage
        self.navigationBar.backIndicatorTransitionMaskImage = indicatorImage
        
        let attributes = [NSAttributedString.Key.foregroundColor: kColorBlack,
                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)];
        self.navigationBar.titleTextAttributes = attributes
    }
    
    // 生成Bar模糊视图
    private func generateEffectView() {
        _effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        _effectView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kNavigatorHeight)
        _effectView.contentView.backgroundColor = kColorBackground.withAlphaComponent(0.9)
    }
    
    // 添加模糊视图
    private func addVisualEffectViewToBar() {
        if _effectView.superview != nil { return }
        let backgroundView = lookupBarBackgroundView()
        backgroundView?.addSubview(_effectView)
    }
    
    // 查找Bar分割线
    private func lookupNavigatorLine() {
        guard let backgroundView = lookupBarBackgroundView() else { return }
        for subview in backgroundView.subviews {
            if subview.bounds.height > 1.0 { continue }
            _navigatorLine = subview
            break
        }
    }
    
    // 查找Barbackground视图
    private func lookupBarBackgroundView() -> UIView? {
        var backgroundClass: AnyClass?
        if let tempClass = NSClassFromString("_UINavigationBarBackground") { // iOS 9
            backgroundClass = tempClass
        } else if let tempClass = NSClassFromString("_UIBarBackground") {
            backgroundClass = tempClass
        }
        if backgroundClass == nil { return nil }
        for subview in self.navigationBar.subviews {
            if subview.isKind(of: backgroundClass!) {
                return subview
            }
        }
        return nil
    }
    
}

extension BaseNavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension BaseNavigationController: UIGestureRecognizerDelegate {
    
    // 返回手势设置
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.children.count > 1 && isPopGestureEnabled
    }
    
}
