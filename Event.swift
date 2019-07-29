//
//  Event.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

//struct Event {
//    var id: Int?
//    var eventName: String?
//    var date: Date?
//    var gradientColor: (String, String)?
//}

@objcMembers class Event: Object {
    dynamic var id: String = UUID().uuidString
    dynamic var eventName: String = ""
    dynamic var date: Date?
    dynamic var firstColor: String?
    dynamic var secondColor: String?

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(eventName: String, date: Date?, firstColor: String?, secondColor: String?) {
        self.init()
        self.eventName = eventName
        self.date = date
        self.firstColor = firstColor
        self.secondColor = secondColor
    }
}
