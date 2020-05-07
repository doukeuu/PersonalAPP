//
//  PunchListController.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/8/1.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchListController: BaseViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "列表"
        generateSubview()
        
        
    }
    
    
    
    
    
}

// MARK: - UI
extension PunchListController {
    
    private func generateSubview() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}

extension PunchListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "kHomeCell")
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: "kHomeCell") }
        cell?.textLabel?.text = "打卡列表"
        return cell!
    }
}

extension PunchListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let punchMonth = PunchMonthController()

        
        self.navigationController?.pushViewController(punchMonth, animated: true)
    }
}
