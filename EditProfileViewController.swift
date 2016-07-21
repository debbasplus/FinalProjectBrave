//
//  editProfileViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-20.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

class EditProfileViewController: UITableViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var username: UITextField!
    
    @IBOutlet var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "EDIT PROFILE"
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.selectPhoto(_:)))
        tap.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(tap)
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true

//        if let user = DataaService.ds.currentUser{
//            username.text = user.desplayName
//            email.text = user.email
//            if user.photoURL != nil {
//                if let data = NSData(contentsOfURL: user.photoURL!) {
//                self.profileImage.image = UIImage.init(data: data)
//                }
//            }
//        }else {
//            //No user is signed in
//        }
    
 }
    
    func selectPhoto(tab: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
        }else{
            imagePicker.sourceType = .PhotoLibrary
        }
        self.presentViewController(imagePicker,animated: true, completion:nil)
    }
    
    // imagepicker delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    // Mark : Action
    
//    @IBAction func saveDidTapped(sender: AnyObject){
//        var data = NSData()
//        data = UIImageJPEGRepresentation(profileImage.image!, 0.1)!
//        ProgressHUD.show("Please wait...", interaction: false)
//        DataaService.ds.SaveProfile()!
//    
//    
//    }

}