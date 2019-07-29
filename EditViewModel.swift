//
//  EditViewModel.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

final class EditViewModel: NSObject {
    private var events: Results<Event>?
    
    var count: Int {
        return events?.count ?? 0
    }
    
    var didMoveToNextPage: ((Int) -> Void)?
    
    subscript(_ index: Int) -> Event? {
        return events?[index] ?? nil
    }
    
    override init() {
        super.init()
        setupData()
    }
    
    private func setupData() {
        events = RealmService.shared.fetch(Event.self)
    }
}

extension EditViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EditCell = collectionView.dequeueReusableCell(for: indexPath)
        guard let event = events?[indexPath.row] else { return UICollectionViewCell() }
        cell.configEditCell(event)
        
        // Edit Event
        cell.didEditEvent = { [weak self] in
            guard let self = self else { return }
            self.didMoveToNextPage?(indexPath.row)
        }
        
        // Delete Event
        cell.didDeleteEvent = { [weak self] in
            guard let self = self else { return }
            
            AlertMessage.showMessage(title: "Message", msg: "Are you sure to delete this ticket?") { result in
                if result {
                    guard let deletedEvent = self.events?[indexPath.row] else { return }
                    RealmService.shared.delete(deletedEvent)
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didMoveToNextPage?(indexPath.row)
    }
}

extension EditViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 32
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
