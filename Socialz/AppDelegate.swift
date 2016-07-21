//
//  AppDelegate.swift
//  Brave
//
//  Created by Rami debbas on 2016-06-03.
//  Copyright © 2016 DebbasPlus. All rights reserved.
//


import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // Use Firebase library to configure APIs
        
      //
        
        FIRApp.configure()
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        login()
        
       // customization after application launch
        UITabBar.appearance().barTintColor = UIColor.whiteColor()
        UITabBar.appearance().tintColor = UIColor.blackColor()
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIStatusBarStyle.LightContent

    
        let font = UIFont(name: "NotoSands-Bold", size: 10)
        if let font = font {
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: font]
        //end of customization
        }
        
        return true
        
    }
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        // Add any custom logic here.
        
        
        return handled
        
        
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
       
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }
    func login(){
        if FIRAuth.auth()?.currentUser != nil {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let tabHome = storyboard.instantiateViewControllerWithIdentifier("TabHome") as!
            UINavigationController
            //self.window?.rootViewController: (tabHome, animated: true, completion: nil)

            window?.rootViewController = tabHome
        }
    
    }
}
//    
//    // MARK: Public
//    
//    var inMainStory: Bool = true
//    
//    
//    func startMainStory() {
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let rootViewController = storyboard.instantiateViewControllerWithIdentifier("MainTabBarController") as! UITabBarController
//        window?.rootViewController = rootViewController
//        
//        inMainStory = true
//    }
//    
//
//
//    }



//var inMainStory: Bool = true
//
//func startShowStory() {
//    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let rootViewController = storyboard.instantiateViewControllerWithIdentifier("ShowNavigationController") as! UINavigationController
//    window?.rootViewController = rootViewController
//    
//    inMainStory = false
//}
//    func startMainStory() {
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let rootViewController = storyboard.instantiateViewControllerWithIdentifier("MainTabBarController") as! UITabBarController
//        window?.rootViewController = rootViewController
//        
//        inMainStory = true
//    }
//
//

//}