//
//  TabBarViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-18.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

class BraveTabBarController: UITabBarController {
     
    
    enum Tab: Int {
        
        case Contacts
        case Feeds
        case Discover
        case Profile
        
        var title: String {
            
            switch self {
            case .Contacts:
                return NSLocalizedString("Contacts", comment: "")
            case .Feeds:
                return NSLocalizedString("Feeds", comment: "")
            case .Discover:
                return NSLocalizedString("Discover", comment: "")
            case .Profile:
                return NSLocalizedString("Profile", comment: "")
            }
        }
    }
    
    private var previousTab: Tab = .Profile
    var tab: Tab? {
        didSet {
            if let tab = tab {
                self.selectedIndex = tab.rawValue
            }
        }
    }
    
    private var checkDoubleTapOnFeedsTimer: NSTimer?
    private var hasFirstTapOnFeedsWhenItIsAtTop = false {
        willSet {
            if newValue {
                let timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(BraveTabBarController.checkDoubleTapOnFeeds(_:)), userInfo: nil, repeats: false)
                checkDoubleTapOnFeedsTimer = timer
                
            } else {
                checkDoubleTapOnFeedsTimer?.invalidate()
            }
        }
    }
    
    @objc private func checkDoubleTapOnFeeds(timer: NSTimer) {
        
        hasFirstTapOnFeedsWhenItIsAtTop = false
    }
    
    private struct Listener {
        static let lauchStyle = "BraveTabBarController.lauchStyle"
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        view.backgroundColor = UIColor.whiteColor()
        

        
        if let items = tabBar.items {
            for i in 0..<items.count {
                let item = items[i]
                item.title = Tab(rawValue: i)?.title
            }
        }
        
        
      
    }
    
    var isTabBarVisible: Bool {
        return self.tabBar.frame.origin.y < CGRectGetMaxY(view.frame)
    }
    
    func setTabBarHidden(hidden: Bool, animated: Bool) {
        
        guard isTabBarVisible == hidden else {
            return
        }
        
        let height = self.tabBar.frame.size.height
        let offsetY = (hidden ? height : -height)
        
        let duration = (animated ? 0.25 : 0.0)
        
        UIView.animateWithDuration(duration, animations: {
            let frame = self.tabBar.frame
            self.tabBar.frame = CGRectOffset(frame, 0, offsetY);
            }, completion: nil)
    }
}

// MARK: - UITabBarControllerDelegate

extension BraveTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        
        guard
            let tab = Tab(rawValue: selectedIndex),
            let nvc = viewController as? UINavigationController else {
                return false
        }
        
        if tab != previousTab {
            return true
        }
        
        if case .Feeds = tab {
            if let vc = nvc.topViewController as? FeedsViewController {
                guard let feedsTableView = vc.feedsTableView else {
                    return true
                }
                if feedsTableView.Brave_isAtTop {
                    if !hasFirstTapOnFeedsWhenItIsAtTop {
                        hasFirstTapOnFeedsWhenItIsAtTop = true
                        return false
                    }
                }
            }
        }
        
        return true
    }
    
    func tryScrollsToTopOfFeedsViewController(vc: FeedsViewController) {
        
        guard let scrollView = vc.feedsTableView else {
            return
        }
        
        if !scrollView.Brave_isAtTop {
            scrollView.Brave_scrollsToTop()
            
        } else {
            
                return
            }
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        guard
            let tab = Tab(rawValue: selectedIndex),
            let nvc = viewController as? UINavigationController else {
                return
        }
        
        
        if tab != previousTab {
            previousTab = tab
            return
        }
        
        switch tab {
            
        case .Contacts:
            if let vc = nvc.topViewController as? ContactsViewController {
                guard let scrollView = vc.contactsTableView else {
                    break
                }
                if !scrollView.Brave_isAtTop {
                    scrollView.Brave_scrollsToTop()
                }
            }
            
        case .Feeds:
            if let vc = nvc.topViewController as? FeedsViewController {
                tryScrollsToTopOfFeedsViewController(vc)
            }
            
        case .Discover:
            if let vc = nvc.topViewController as? DiscoverViewController {
                guard let scrollView = vc.discoveredUsersCollectionView else {
                    break
                }
                if !scrollView.Brave_isAtTop {
                    scrollView.Brave_scrollsToTop()
                }
            }
            
        case .Profile:
            if let vc = nvc.topViewController as? ProfileViewController {
                guard let scrollView = vc.ProfileTableViewController else {
                    break
                }
                if !scrollView.Brave_isAtTop {
                    scrollView.Brave_scrollsToTop()
                }
            }
        }

    }
}