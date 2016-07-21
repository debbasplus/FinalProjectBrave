//
//  DiscoverCollectionView.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-19.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

class DiscoverCollectionView: UICollectionView {
    
        // ref http://stackoverflow.com/questions/19483511/uirefreshcontrol-with-uicollectionview-in-ios7
        override var contentInset: UIEdgeInsets {
            didSet {
                if tracking {
                    let diff = contentInset.top - oldValue.top
                    var translation = panGestureRecognizer.translationInView(self)
                    translation.y -= diff * 3 / 2
                    panGestureRecognizer.setTranslation(translation, inView: self)
                }
            }
        }
}
