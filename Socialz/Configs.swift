////
////  Configs.swift
////  Brave
////
////  Created by Rami debbas on 2016-06-03.
////  Copyright © 2016 DebbasPlus. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//
//// IMPORTANT: REPLACE THE RED STRING BELOW WITH THE UNIT ID YOU'VE GOT BY REGISTERING YOUR APP IN http://www.apps.admob.com
//let ADMOB_BANNER_UNIT_ID = "ca-app-pub-9733347540588953/7805958028"
//
//
//
//// DICTIONARY OF SOCIAL LINKS AMND THEIR NAMES: PLEASE NOTE THAT THE STRING INTO "name" FIELD MUST BE EQUAL TO THE NAMES YOU'LL GIVE TO THE SOCIAL ICONS FOLDER (INTO Assets.xcassets)
//let socials = [
//    
//    //      -- Name --              ------ Link -------
//    ["name":"Facebook",     "link":"http://facebook.com"],
//    ["name":"Twitter",      "link":"https://twitter.com"],
//    ["name":"YouTube",      "link":"https://youtube.com"],
//    ["name":"Pinterest",    "link":"https://pinterest.com"],
//    //["name":"500px",        "link":"https://500px.com",],
//    //["name":"AOL",          "link":"http://aol.com"],
//    //["name":"Basecamp",     "link":"https://basecamp.com"],
//    //["name":"Delicious",    "link":"http://delicious.com"],
//    //["name":"Behance",      "link":"https://behance.net"],
//    //["name":"Digg",         "link":"http://digg.com"],
//    //["name":"Deviantart",   "link":"http://deviantart.com"],
//    //["name":"Dribbble",     "link":"https://dribbble.com"],
//    ["name":"Dropbox",      "link":"https://dropbox.com/"],
//    //["name":"Evernote",     "link":"https://evernote.com"],
//    //["name":"Flickr",       "link":"https://www.flickr.com"],
//    ["name":"Google+",      "link":"https://plus.google.com"],
//    //["name":"Grooveshark",  "link":"http://groovesharks.org"],
//    //["name":"Hi5",          "link":"http://hi5.com/mobile"],
//    ["name":"Instagram",    "link":"https://instagram.com"],
//    //["name":"Instapaper",   "link":"https://instapaper.com"],
//    ["name":"Linkedin",     "link":"https://linkedin.com"],
//    //["name":"Livejournal",  "link":"http://livejournal.com"],
//    //["name":"MySpace",      "link":"https://myspace.com"],
//    ["name":"Reddit",       "link":"https://reddit.com/mobile"],
//    //["name":"Tumblr",       "link":"https://tumblr.com"],
//    //["name":"Vimeo",        "link":"https://vimeo.com"],
//    
//    // You can add more items here...
//    
//]
//
//
//// IF YOU'LL ADD/REMOVE SOME ITEM INTO socials DICTIONARY, REMEMEBER TO UPDATE THIS ARRAY TOO -> THE NUMBER OF ITEMS HERE MUST BE EUQAL TO THE NUMBER OF ITEMS OF THE socials DICTIONARY ABOVE, OTHERWISE THE APP WILL CRASH
//let socialColors = [
//    UIColor(red: 76.0/255.0, green: 102.0/255.0, blue: 165.0/255.0, alpha: 1.0),    // Facebook
//    UIColor(red: 51.0/255.0, green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0),    // Twitter
//    UIColor(red: 197.0/255.0, green: 48.0/255.0, blue: 43.0/255.0, alpha: 1.0),     // YouTube
//    UIColor(red: 203.0/255.0, green: 33.0/255.0, blue: 38.0/255.0, alpha: 1.0),     // Pinterest
//   // UIColor(red: 79.0/255.0, green: 93.0/255.0, blue: 116.0/255.0, alpha: 1.0),     // 500px
//   // UIColor(red: 23.0/255.0, green: 23.0/255.0, blue: 23.0/255.0, alpha: 1.0),      // Aol
//   // UIColor(red: 115.0/255.0, green: 164.0/255.0, blue: 118.0/255.0, alpha: 1.0),   // Basecamp
//   // UIColor(red: 82.0/255.0, green: 141.0/255.0, blue: 204.0/255.0, alpha: 1.0),    // Behance
//   // UIColor(red: 81.0/255.0, green: 121.0/255.0, blue: 177.0/255.0, alpha: 1.0),    // Delicious
//   // UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // Digg
//   // UIColor(red: 86.0/255.0, green: 129.0/255.0, blue: 105.0/255.0, alpha: 1.0),    // Deviantart
//   // UIColor(red: 180.0/255.0, green: 93.0/255.0, blue: 124.0/255.0, alpha: 1.0),    // Dribbble
//    UIColor(red: 102.0/255.0, green: 149.0/255.0, blue: 192.0/255.0, alpha: 1.0),   // Dropbox
//   // UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // Evernote
//   // UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // Flickr
//    UIColor(red: 182.0/255.0, green: 92.0/255.0, blue: 83.0/255.0, alpha: 1.0),     // Google+
//   // UIColor(red: 225.0/255.0, green: 113.0/255.0, blue: 82.0/255.0, alpha: 1.0),    // Grooveshark
//   // UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // Hi5
//    UIColor(red: 122.0/255.0, green: 106.0/255.0, blue: 100.0/255.0, alpha: 1.0),   // Instagram
//   // UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // Instapaper
//    UIColor(red: 51.0/255.0, green: 127.0/255.0, blue: 158.0/255.0, alpha: 1.0),    // Linkedin
//   // UIColor(red: 77.0/255.0, green: 93.0/255.0, blue: 134.0/255.0, alpha: 1.0),     // Livejournal
//   // UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // MySpace
//    UIColor(red: 107.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0),   // Reddit
//   // UIColor(red: 85.0/255.0, green: 104.0/255.0, blue: 121.0/255.0, alpha: 1.0),    // Tumblr
//   // UIColor(red: 70.0/255.0, green: 162.0/255.0, blue: 192.0/255.0, alpha: 1.0),    // Vimeo
//    
//    // You can add new colors here...
//]
//
//
//
//
//
//// HUD View (Customizable)
//let hudView = UIView(frame: CGRectMake(0, 0, 80, 80))
//let indicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 80, 80))
//extension UIViewController {
//    func showHUD() {
//        hudView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
//        hudView.alpha = 0.9
//        hudView.layer.cornerRadius = hudView.bounds.size.width/2
//        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
//        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
//        indicatorView.color = UIColor.whiteColor()
//        hudView.addSubview(indicatorView)
//        indicatorView.startAnimating()
//        view.addSubview(hudView)
//    }
//    func hideHUD() { hudView.removeFromSuperview() }
//}
//
//
//
//
//
///****** Not For Edit ******/
//var selectedSocial = ""
//var selectedName = ""
//var selectedColor = UIColor()
//
//
