//
//  DataService.swift
//  Brave
//
//  Created by Rami debbas on 2016-06-03.
//  Copyright © 2016 DebbasPlus. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

    let URL_BASE = FIRDatabase.database().reference()

class DataaService {
    static let ds = DataaService()
    
    init() {}
    private var _REF_BASE = URL_BASE
    private var _REF_POSTS = URL_BASE.child ("posts")
    private var _REF_USERS = URL_BASE.child ("users")

    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }

    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }

    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = URL_BASE.child("users").child(uid)
        return user
    }

    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(user)
    }
    var StorageRef: FIRStorageReference{
                return FIRStorage.storage().reference()
            }
        
            var fileURL: String? = nil
        
        
    func SignUP(username: String, email: String, password: String, data:NSData) {
                FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error)in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    let changeRequest = user?.profileChangeRequest()
                    changeRequest?.displayName = username
                    changeRequest?.commitChangesWithCompletion({ (error) in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }
                    })
                    let filePath = "profileEmage/\(user!.uid)"
                    let metadata = FIRStorageMetadata ()
                    metadata.contentType = "image/jpeng"
        
                    self.StorageRef.child(filePath).putData(data,metadata: metadata, completion: { (metadata,error) in
                        if let error = error {
                            print("\(error.description)")
                            return
                        }
                        self.fileURL = (metadata?.downloadURLs![0].absoluteString)!
                        let changeRequesttPhoto = user!.profileChangeRequest()
                        changeRequesttPhoto.photoURL = NSURL(string: self.fileURL!)
                        changeRequesttPhoto.commitChangesWithCompletion({ (error) in
                            if let error = error {
                                print(error,NSLocalizedDescriptionKey)
                                return
                            }else{
                                print("profile Updated")
                            }
                        })
                        ProgressHUD.show("Succsseded")
                        let appdelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appdelegate.login()
                    })
                    
                })
        }
    

//implimint Login Func
    
    func login(email: String, paswword: String){
        FIRAuth.auth()?.signInWithEmail(email, password: paswword, completion: {(user,error) in
            if let error = error {
           print (error.localizedDescription)
                return
            }
            ProgressHUD.showSuccess("Succeeded")
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.login()
    })
}
 
func logout() {
    let firebaseAuth = FIRAuth.auth()
    do {
        try firebaseAuth?.signOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewControllerWithIdentifier("LogInVC")
        UIApplication.sharedApplication()
        .keyWindow?.rootViewController = loginVC
    }catch let signOutErorr as NSError {
        print("Error signing out : \(signOutErorr)")
        }
    }
    // update profile
    
//    func SaveProfile(username:String, email:String, data: NSData{
//        let filePath = "\(FIRAuth.auth()?.currentuser!.uid)/\(Int(NSDate.timeIntervalSinceREferenceDAte()))"
//        let metaData = FI
//
//}
}