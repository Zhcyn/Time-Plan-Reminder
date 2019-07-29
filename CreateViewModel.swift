//
//  CreateViewModel.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/2/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

final class CreateViewModel: NSObject {
    private var numberOfItemPerRow: Int = 5
    
    private var menuColor: [MenuColor] = [] {
        didSet {
            didChange?()
        }
    }
    
    var didChange: (() -> Void)?
    
    override init() {
        super.init()
        Colors.getAllValues().forEach {
            let newItem = MenuColor(isSelected: false, firstColor: $0.0, secondColor: $0.1)
            menuColor.append(newItem)
        }
        
        // Set default color
        menuColor[0].isSelected = true
    }
    
    func createEvent(eventName: String, date: Date) {
        let selectedColor = menuColor.filter {
            $0.isSelected == true
        }
        
        let newEvent = Event(eventName: eventName, date: date, firstColor: selectedColor.last?.firstColor, secondColor: selectedColor.last?.secondColor)
        
        RealmService.shared.create(newEvent)
    }
}

extension CreateViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ColorCell = collectionView.dequeueReusableCell(for: indexPath)
        let radius = ((collectionView.frame.width - CGFloat(max(0, numberOfItemPerRow - 1) * 16)) / CGFloat(numberOfItemPerRow)) / 2
        
        cell.configColorCell(colors: menuColor[indexPath.row], corRadius: radius)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for index in 0..<menuColor.count {
            menuColor[index].isSelected = false
        }
        
        menuColor[indexPath.row].isSelected = true
    }
}

extension CreateViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - CGFloat(max(0, numberOfItemPerRow - 1) * 16)) / CGFloat(numberOfItemPerRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
