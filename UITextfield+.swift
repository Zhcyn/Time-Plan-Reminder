//
//  UITextfield+.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

extension UITextField {
    func setUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
