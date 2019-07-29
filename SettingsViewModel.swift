//
//  SettingsViewModel.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/5/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

final class SettingsViewModel: NSObject {
    var didChange: (() -> Void)?
    
    override init() {
        super.init()
    }
}


