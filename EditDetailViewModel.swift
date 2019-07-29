//
//  EditDetailViewModel.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

final class EditDetailViewModel: NSObject {
    private var numberOfItemPerRow: Int = 5
    
    private var menuColor: [MenuColor] = [] {
        didSet {
            didChange?()
        }
    }
    
    var didChange: (() -> Void)?
    
    override init() {
        super.init()
        for color in Colors.getAllValues() {
            let newItem = MenuColor(isSelected: false, firstColor: color.0, secondColor: color.1)
            menuColor.append(newItem)
        }
    }
    
    func setupData(_ event: Event) {
        for index in 0..<menuColor.count {
            if menuColor[index].firstColor == event.firstColor && menuColor[index].secondColor == event.secondColor {
                menuColor[index].isSelected = true
            }
        }
    }
    
    func updateEvent(oldEvent: Event, newEventName: String, newDate: Date) {
        let selectedColor = menuColor.filter {
            $0.isSelected == true
        }
        
        guard let firstColor = selectedColor.last?.firstColor,
            let secondColor = selectedColor.last?.secondColor else { return }
        
        let dicEvent: [String: Any] = ["eventName": newEventName, "date": newDate, "firstColor":
            firstColor, "secondColor": secondColor]
        RealmService.shared.update(oldEvent, with: dicEvent)
    }
}

extension EditDetailViewModel: UICollectionViewDataSource {
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

extension EditDetailViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - CGFloat(max(0, numberOfItemPerRow - 1) * 16)) / CGFloat(numberOfItemPerRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
