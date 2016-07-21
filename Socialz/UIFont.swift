//
//  UIFont.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-19.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func skillDiscoverTextFont() -> UIFont {
        return UIFont.systemFontOfSize(11)
    }
    
    class func skillTextFont() -> UIFont {
        return UIFont.systemFontOfSize(14)
    }
    
    class func skillTextLargeFont() -> UIFont {
        return UIFont.systemFontOfSize(20)
    }
    
    class func skillHomeTextLargeFont() -> UIFont {
        return UIFont.systemFontOfSize(18)
    }
    
    class func skillHomeButtonFont() -> UIFont {
        return UIFont.systemFontOfSize(16)
    }
    
    class func barButtonFont() -> UIFont {
        return UIFont.systemFontOfSize(14)
    }
    
    class func navigationBarTitleFont() -> UIFont { // make sure it's the same as system use
        return UIFont.boldSystemFontOfSize(17)
    }
}

