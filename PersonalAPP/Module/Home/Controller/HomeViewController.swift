//
//  HomeViewController.swift
//  PersonalAPP
//
//  Created by panwei on 2019/6/24.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateSubview()
    }

}

// MARK: - UI
extension HomeViewController {
    private func generateSubview() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "kHomeCell")
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: "kHomeCell") }
        cell?.textLabel?.text = "备忘录"
        return cell!
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(MemoListController(), animated: true)
    }
}
