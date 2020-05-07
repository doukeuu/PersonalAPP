//
//  PunchYearController.swift
//  PersonalAPP
//
//  Created by PANSIR on 2019/9/7.
//  Copyright © 2019 PANSIR. All rights reserved.
//

import UIKit

class PunchYearController: BaseViewController {

    private var headView: PunchYearHeadView!    // head view
    private var collectionView: UICollectionView! // date collection view
    
    private let sectionNumber = 40
    private var deviation = -20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateSubview()
        resetColletionViewContentOffset()
    }
    
}

// MARK: - Subview
extension PunchYearController {
    
    private func generateSubview() {
        // head view
        let width = self.view.bounds.width
        var frame = CGRect(x: 0, y: 88, width: width, height: 140)
        headView = PunchYearHeadView(frame: frame)
        headView.countLabel.text = "2"
        self.view.addSubview(headView)
        
        // collection flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.minimumLineSpacing = 1
        flowLayout.headerReferenceSize = CGSize(width: width, height: 50)
        
        // date collection view
        let height = self.view.bounds.height
        let headViewMaxY = headView.frame.maxY
        frame = CGRect(x: 0, y: headViewMaxY, width: width, height: height - headViewMaxY)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.decelerationRate = .normal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(PunchYearDateCell.self, forCellWithReuseIdentifier: "kDateCell")
        collectionView.register(PunchYearDateView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "kDateView")
        self.view.insertSubview(collectionView, belowSubview: headView)
        collectionView.layoutIfNeeded()
    }
    
}

// MARK: - UICollectionViewDataSource
extension PunchYearController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kDateCell", for: indexPath) as! PunchYearDateCell
        cell.dateComponents = DateHandler.componentsWithMonthDeviation(deviation + indexPath.section)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "kDateView", for: indexPath) as! PunchYearDateView
        view.components = DateHandler.componentsWithMonthDeviation(deviation + indexPath.section)
        return view
    }
    
}

extension PunchYearController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let components = DateHandler.componentsWithMonthDeviation(deviation  + indexPath.section)
        let rowNumber = DateHandler.labelShouldHidden(with: components) ? 5 : 6
        let width = self.view.bounds.size.width
        return CGSize(width: width, height: width / 7.0 * CGFloat(rowNumber))
    }
    
}

// UIScrollViewDelegate
extension PunchYearController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentSection = sectionAtPoint(collectionView.contentOffset)
        let division = abs(currentSection - sectionNumber)
        if division < sectionNumber / 4 || division > sectionNumber / 4 * 3 {
            let gap = sectionNumber / 2 - currentSection
            deviation -= gap
            resetColletionViewContentOffset()
            collectionView.reloadData()
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > -0.6 && velocity.y < 0.6 { return }
        let originPoint = targetContentOffset.pointee
        let targetPoint = sectionHeaderPoint(with: originPoint)
        targetContentOffset.pointee = targetPoint
    }
    
}

// MARK: - Seek
extension PunchYearController {
    
    private func resetColletionViewContentOffset() {
        let indexPath = IndexPath(item: 0, section: sectionNumber/2)
        let kind = UICollectionView.elementKindSectionHeader
        let attributes = collectionView.layoutAttributesForSupplementaryElement(ofKind: kind, at: indexPath)
        collectionView.contentOffset = (attributes?.frame.origin)!
    }
    
    private func sectionAtPoint(_ point: CGPoint) -> Int {
        var indexPath = collectionView?.indexPathForItem(at: point)
        var targetPoint = point
        while indexPath == nil { // if target is top or bottom, can't find indexPath
            targetPoint.y += 10
            indexPath = collectionView?.indexPathForItem(at: targetPoint)
        }
        return indexPath?.section ?? 0
    }
    
    // collectionView section header frame origin at the point
    private func sectionHeaderPoint(with point: CGPoint) -> CGPoint {
        var indexPath = collectionView?.indexPathForItem(at: point)
        var targetPoint = point
        while indexPath == nil { // if target is top or bottom, can't find indexPath
            targetPoint.y += 10
            indexPath = collectionView?.indexPathForItem(at: targetPoint)
        }
        let kind = UICollectionView.elementKindSectionHeader
        let attributes = collectionView?.layoutAttributesForSupplementaryElement(ofKind: kind, at: indexPath!)
        return attributes?.frame.origin ?? point
    }
    
}
