//
//  UILabel+.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/28/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

extension UILabel {
    func addDateAttributedText(_ date: String) {
        let attributedText: NSMutableAttributedString!
        
        if UIDevice.current.screenType == UIDevice.ScreenType.iPhones_5_5s_5c_SE ||
            UIDevice.current.screenType == UIDevice.ScreenType.iPhones_4_4S {
            attributedText = NSMutableAttributedString(string: date, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: " days", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
        } else {
            attributedText = NSMutableAttributedString(string: date, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26)])
            attributedText.append(NSAttributedString(string: " days", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]))
        }
        
        self.attributedText = attributedText
        return
    }
}
