//
//  Models.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-21.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

public class Avatar: Object {
    public dynamic var avatarURLString: String = ""
    public dynamic var avatarFileName: String = ""
    
    public dynamic var roundMini: NSData = NSData() // 60
    public dynamic var roundNano: NSData = NSData() // 40
    
    let users = LinkingObjects(fromType: User.self, property: "avatar")
    public var user: User? {
        return users.first
    }
    
}



public class User: Object {
    public dynamic var isMe: String = ""
    public dynamic var userID: String = ""
    public dynamic var username: String = ""
    public dynamic var nickname: String = ""
    public dynamic var introduction: String = ""
    public dynamic var avatarURLString: String = ""
    public dynamic var avatar: Avatar?
    public dynamic var badge: String = ""
    public dynamic var blogURLString: String = ""
    public dynamic var blogTitle: String = ""
    
    public override class func indexedProperties() -> [String] {
        return ["userID"]
    }
}
public class UserSocialAccountProvider: Object {
    public dynamic var name: String = ""
    public dynamic var enabled: Bool = false
}

public var socialAccountProviders = List<UserSocialAccountProvider>()
