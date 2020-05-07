//
//  HomePageController.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/11/23.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class HomePageController: BaseViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        generateSubview()
    }
    
}

// MARK: - UI
extension HomePageController {
    
    private func generateSubview() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}

extension HomePageController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "kHomeCell")
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: "kHomeCell") }
        cell?.textLabel?.text = indexPath.row == 0 ? "备忘录" : "打卡记录"
        return cell!
    }
}

extension HomePageController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(MemoListController(), animated: true)
        } else {
            self.navigationController?.pushViewController(PunchListController(), animated: true)
        }
        
    }
}
