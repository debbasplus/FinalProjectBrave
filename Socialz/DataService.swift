////
////  DataService.swift
////  Brave
////
////  Created by Rami debbas on 2016-07-18.
////  Copyright © 2016 Debbasplus. All rights reserved.
////
//
//import Foundation
//import Foundation
//import Firebase
//import FirebaseAuth
//import FirebaseDatabase
//import FirebaseStorage
//
//
//private var _BASE_REF = FIRDatabase.database().reference()
//
//class DataService  {
//    
//    static let dataService = DataService()
//
//    
//    var BASE_REF : FIRDatabaseReference{
//        return _BASE_REF
//    }
//    
//    var StorageRef: FIRStorageReference{
//        return FIRStorage.storage().reference()
//    }
//    
//    var fileURL: String? = nil
//
//    
//    func SignUP(username: String, email: String, password: String, data:NSData) {
//        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error)in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            let changeRequest = user?.profileChangeRequest()
//            changeRequest?.displayName = username
//            changeRequest?.commitChangesWithCompletion({ (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//            })
//            let filePath = "profileEmage/\(user!.uid)"
//            let metadata = FIRStorageMetadata ()
//            metadata.contentType = "image/jpeng"
//            
//            self.StorageRef.child(filePath).putData(data,metadata: metadata, completion: { (metadata,error) in
//                if let error = error {
//                    print("\(error.description)")
//                    return
//                }
//                self.fileURL = (metadata?.downloadURLs![0].absoluteString)!
//                let changeRequesttPhoto = user!.profileChangeRequest()
//                changeRequesttPhoto.photoURL = NSURL(string: self.fileURL!)
//                changeRequesttPhoto.commitChangesWithCompletion({ (error) in
//                    if let error = error {
//                        print(error,NSLocalizedDescriptionKey)
//                        return
//                    }else{
//                        print("profile Updated")
//                    }
//                })
//                ProgressHUD.show("Succsseded")
//                let appdelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//                appdelegate.login()
//            })
//            
//        })
//    }
//}
