//
//  BaseTabBarController.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/11/23.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    private var _effectView: UIVisualEffectView! // 模糊视图
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundImage = UIImage.imageWithColor(.clear)
        self.tabBar.shadowImage = UIImage.imageWithColor(kColorSeparation)
        
        generateTabBarEffectView()
        
//        generateChild(controller: HomePageController(), itemInfo: ["首页",    "tabbar_home_n", "tabbar_home_s"])
//        generateChild(controller: ShopPageController(), itemInfo: ["线下门店", "tabbar_shop_n", "tabbar_shop_s"])
//        generateChild(controller: FindPageController(), itemInfo: ["发现",    "tabbar_find_n", "tabbar_find_s"])
//        generateChild(controller: CartPageController(), itemInfo: ["购物车",  "tabbar_cart_n", "tabbar_cart_s"])
//        generateChild(controller: MinePageController(), itemInfo: ["我的",    "tabbar_mine_n", "tabbar_mine_s"])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addVisualEffectViewToBar()
    }
    
}

// MARK: - Subviews
extension BaseTabBarController {
    
    // 生成背景模糊视图
    private func generateTabBarEffectView() {
        _effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        _effectView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kTabBarHeight)
        _effectView.contentView.backgroundColor = kColorBackground.withAlphaComponent(0.9)
    }
    
    // 生成子控制器
    private func generateChild(controller: UIViewController, itemInfo: [String]) {
        let item = generateTabBarItem(title: itemInfo[0], normal: itemInfo[1], selected: itemInfo[2])
        let navigation = BaseNavigationController(rootViewController: controller)
        navigation.tabBarItem = item
        self.addChild(navigation)
    }
    
    // 生成tabBarItem
    private func generateTabBarItem(title: String, normal: String, selected: String) -> UITabBarItem {
        let normalImage = UIImage(named: normal)?.withRenderingMode(.alwaysOriginal)
        let selectedImage = UIImage(named: selected)?.withRenderingMode(.alwaysOriginal)
        let item = UITabBarItem(title: title, image: normalImage, selectedImage: selectedImage)
        
        let normalAttributes   = [NSAttributedString.Key.foregroundColor: kColorLightGray,
                                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: kColorOrange,
                                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        item.setTitleTextAttributes(normalAttributes, for: .normal)
        item.setTitleTextAttributes(selectedAttributes, for: .selected)
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        return item
    }
    
    // 添加模糊视图
    private func addVisualEffectViewToBar() {
        if _effectView.superview != nil { return }
        var backgroundClass: AnyClass?
        if let tempClass = NSClassFromString("_UINavigationBarBackground") { // iOS 9
            backgroundClass = tempClass
        } else if let tempClass = NSClassFromString("_UIBarBackground") {
            backgroundClass = tempClass
        }
        for subview in self.tabBar.subviews {
            if !subview.isKind(of: backgroundClass!) { continue }
            subview.addSubview(_effectView)
        }
    }
    
}
