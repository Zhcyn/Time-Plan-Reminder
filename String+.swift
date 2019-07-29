//
//  String+.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/4/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


extension String {
    func removeWhitespace() -> String {
        return self.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
    }
}
