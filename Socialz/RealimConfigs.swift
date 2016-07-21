////
////  RealimConfigs.swift
////  Brave
////
////  Created by Rami debbas on 2016-07-07.
////  Copyright © 2016 Debbasplus. All rights reserved.
////
//
//
import Foundation
import RealmSwift

public func realmConfig() -> Realm.Configuration {
    
    
    let appGroupID: String = "debbaspuls.Brave"

    let directory: NSURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(appGroupID)!
    let realmFileURL = directory.URLByAppendingPathComponent("db.realm")
    
    var config = Realm.Configuration()
    config.fileURL = realmFileURL
    config.schemaVersion = 33
    config.migrationBlock = { migration, oldSchemaVersion in
    }
    
    return config
}

