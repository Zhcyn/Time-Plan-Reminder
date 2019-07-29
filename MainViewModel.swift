//
//  MainViewModel.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

final class MainViewModel: NSObject {
    private var events: Results<Event>?
    
    var count: Int {
        return events?.count ?? 0
    }
    
    override init() {
        super.init()
        setupData()
    }
    
    private func setupData() {
        events = RealmService.shared.fetch(Event.self)
    }
}

extension MainViewModel: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EventCell = collectionView.dequeueReusableCell(for: indexPath)
        guard let event = events?[indexPath.row] else { return UICollectionViewCell() }
        cell.configCell(event)
        
        return cell
    }
}

extension MainViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 32
        return CGSize(width: width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
