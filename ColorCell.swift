//
//  ColorCell.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/2/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class ColorCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var selectedView: UIView!
    
    func configColorCell(colors: MenuColor, corRadius: CGFloat) {
        guard let firstColor = colors.firstColor,
            let secondColor = colors.secondColor,
            let isSelected = colors.isSelected else { return }
        
        selectedView.cornerRadius = corRadius / 2
        selectedView.isHidden = !isSelected
        colorView.cornerRadius = corRadius
        
        setNeedsLayout()
        layoutIfNeeded()
        colorView.setGradientLayer(color1: firstColor, color2: secondColor)
    }
}
