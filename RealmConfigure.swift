//
//  RealmConfigure.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/4/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class RealmConfigure {
    // MARK: - Properties
    static let currentSchemaVersion: UInt64 = 1
    
    static func configureMigration() {
        //Step 1: Create realm configure
        let config = Realm.Configuration(schemaVersion: currentSchemaVersion, migrationBlock: nil)
        
        //Step 2: Set configuration of realm and create Realm()
        Realm.Configuration.defaultConfiguration = config
        
        do {
            RealmService.shared.realmDB = try Realm(configuration: config)
        } catch let error as NSError {
            print("Error opening realm: \(error)")
        }
    }
}
