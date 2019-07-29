//
//  PaddingLabel.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/5/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class PaddingLabel: UILabel {
    let padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
}
