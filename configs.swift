////
////  configs.swift
////  Brave
////
////  Created by Rami debbas on 2016-07-19.
////  Copyright © 2016 Debbasplus. All rights reserved.
////
//
//import Foundation
//
//import UIKit
//
//
//
//
//// IMPORTANT: Replace the red string below with the new name you'll give to this app
//let APP_NAME = "AskIt"
//
//
//// IMPORTANT: Replace the email address below with your the one you'll dedicate to User to report abusive/inappropriate content
//let REPORT_EMAIL_ADDRESS = "report@mydomain.com"
//
//
//
//// IMPORTANT: REPLACE THE RED STRING BELOW WITH YOUR OWN BANNER UNIT ID YOU'LL GET FROM  http://apps.admob.com
//let ADMOB_BANNER_UNIT_ID = "ca-app-pub-9733347540588953/6145924825"
//
//
//// IMPORTANT: REPLACE THE RED STRING BELOW WITH THE APP ID YOU CAN GRAB FROM YOUR OneSignal DASHBOARD -> App Settings
//// THIS IS TO ALLOW YOU TO SEND PUSH NOTIFICATIONS TO ALL REGISTERED USERS
//let ONESIGNAL_APP_ID = "8338d612-aae0-48c3-89e5-52ebed2cc1ce"
//
//
//
//// IMPORTANT: Reaplce the red strings below with your own Application ID and Client Key of your app on Parse.com
//let PARSE_APP_KEY = "pRRZ44rKY9SW5VBn4WdrlaeQNgM546L9Zd3It7Pv"
//let PARSE_CLIENT_KEY = "cHCQvyaeNzhZDZfZ7A1uUCGKK7s6bZgFk2V2rL2Y"
//
//
//
//// YOU CAN CHANGE THE RGB VALUES OF THIS COLOR AS YOU WISH
//let MAIN_COLOR = UIColor(red: 105/255, green: 209/255, blue: 201/255, alpha: 1)
//
//
//
//// HUD View
//let hudView = UIView(frame: CGRectMake(0, 0, 80, 80))
//let label = UILabel()
//let indicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 80, 80))
//extension UIViewController {
//    func showHUD() {
//        hudView.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
//        hudView.backgroundColor = MAIN_COLOR
//        hudView.alpha = 1.0
//        hudView.layer.cornerRadius = hudView.bounds.size.width/2
//        
//        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
//        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
//        hudView.addSubview(indicatorView)
//        indicatorView.startAnimating()
//        view.addSubview(hudView)
//    }
//    
//    func hideHUD() { hudView.removeFromSuperview() }
//    
//    func simpleAlert(mess:String) {
//        UIAlertView(title: APP_NAME, message: mess, delegate: nil, cancelButtonTitle: "OK").show()
//    }
//}
//
//
//
//
//
//
//
//
///****** DO NOT EDIT THE CODE BELOW *****/
//let USER_USERNAME = "username"
//let USER_EMAIL = "email"
//let USER_FULLNAME = "fullName"
//let USER_AVATAR = "avatar"
//let USER_PUSH_ID = "pushID"
//
//let QUESTIONS_CLASS_NAME = "Questions"
//let QUESTIONS_TEXT = "text"
//let QUESTIONS_USER_POINTER = "userPointer"
//let QUESTIONS_ANSWERS = "answers"
//let QUESTIONS_LIKES = "likes"
//let QUESTIONS_KEYWORDS = "keywords"
//let QUESTIONS_IS_REPORTED = "isReported"
//let QUESTIONS_REPORT_MESSAGE = "reportMessage"
//
//let LIKES_CLASS_NAME = "Likes"
//let LIKES_QUESTION_POINTER = "questionPointer"
//let LIKES_USER_POINTER = "userPointer"
//
//let ANSWERS_CLASS_NAME = "Answers"
//let ANSWERS_USER_POINTER = "userPointer"
//let ANSWERS_QUESTION_POINTER = "questionPointer"
//let ANSWERS_TEXT = "text"
//let ANSWERS_IS_REPORTED = "isReported"
//let ANSWERS_REPORT_MESSAGE = "reportMessage"
//
//
//let ACTIVITY_CLASS_NAME = "Activity"
//let ACTIVITY_CURRENT_USER = "currentUser"
//let ACTIVITY_OTHER_USER = "otherUser"
//let ACTIVITY_TEXT = "text"
//
