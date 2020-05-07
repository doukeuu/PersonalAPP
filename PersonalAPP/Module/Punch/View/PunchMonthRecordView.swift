//
//  PunchMonthRecordView.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/10/11.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchMonthRecordView: UIView {

    private var collectionView: UICollectionView!
    private let sectionNum = 5
    private var handlers = [PunchMonthHandler]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        initializeHandlers()
        generateSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeHandlers() {
        for i in -(sectionNum/2)..<(sectionNum/2 + 1) {
            let handler = PunchMonthHandler()
            handler.monthDeviation = i
            handlers.append(handler)
        }
    }
    
}

// MARK: - Subviews
extension PunchMonthRecordView {
    
    private func generateSubviews() {
        
        // week names with equal spacing
        let weekArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        let weekWidth = self.bounds.width / CGFloat(weekArray.count)
        var rect = CGRect(x: 0, y: 0, width: weekWidth, height: 36)
        
        for weekName in weekArray {
            let label = UILabel(frame: rect)
            label.backgroundColor = .orange
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .white
            label.textAlignment = .center
            label.text = weekName
            self.addSubview(label)
            rect.origin.x = rect.maxX
        }
        
        rect = CGRect(x: 10, y: 46, width: self.frame.width - 20, height: self.frame.height - 46 - 10)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PunchMonthDayCell.self, forCellWithReuseIdentifier: "kDayCell")
        self.addSubview(collectionView)
        
        collectionView.layoutIfNeeded()
        let offsetX = (self.bounds.width - 20) * CGFloat(sectionNum / 2)
        collectionView.contentOffset = CGPoint(x: offsetX, y: 0)
    }
    
}

// MARK: - UICollectionViewDataSource
extension PunchMonthRecordView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionNum
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handlers[section].itemNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kDayCell", for: indexPath) as! PunchMonthDayCell
        cell.dayLabel.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        cell.dayLabel.layer.borderColor = UIColor.orange.cgColor
        cell.text = handlers[indexPath.section].dayNumber(at: indexPath.item)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PunchMonthRecordView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return handlers[section].itemSpacing(with: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return PunchMonthHandler.cellSize(with: collectionView.frame.size)
    }
    
}

// MARK: - UIScrollViewDelegate
extension PunchMonthRecordView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let offsetX = scrollView.contentOffset.x
        if offsetX > width * 3 - 0.1 {
            for handler in handlers {
                handler.monthDeviation += 1
            }
            collectionView.reloadData()
        } else if offsetX < width + 0.1 {
            for handler in handlers {
                handler.monthDeviation -= 1
            }
            collectionView.reloadData()
        } else {
            return
        }
        scrollView.setContentOffset(CGPoint(x: width * 2, y: 0), animated: false)
    }
    
}
