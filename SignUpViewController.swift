//
//  SignUpViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-18.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // Mark : Outlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!

    let imagePicker = UIImagePickerController()
    var selectedPhoto: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.selectPhoto(_:)))
        tap.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(tap)
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true

    }
    
    func selectPhoto(tab: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            self.imagePicker.sourceType = .Camera
        }else{
            self.imagePicker.sourceType = .PhotoLibrary
        }
        self.presentViewController(imagePicker,animated: true, completion:nil)
        }
    
    
    // Mark : Action
    
    @IBAction func CAncelDidTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func SignUpDidTapped(sender: AnyObject) {
        
        
        guard let email = emailTextFiled.text where !email.isEmpty, let pasword = passwordTextFiled.text where !pasword.isEmpty, let username = usernameTextField.text where !username.isEmpty else{
            return
        }
        var data = NSData()
        data =  UIImageJPEGRepresentation(profileImage.image!, 0.1)!
        // signing up
        ProgressHUD.show("Please wait ....", interaction: false)
       DataaService.ds.SignUP(username, email: email, password: pasword, data: data)
    }
    }




extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // ImagePicker delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        selectedPhoto = info[UIImagePickerControllerEditedImage] as? UIImage
        self.profileImage.image = selectedPhoto
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

