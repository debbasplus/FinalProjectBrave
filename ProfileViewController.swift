//
//  ProfileViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-19.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit
import FirebaseAuth


class ProfileViewController:  UIViewController, UINavigationControllerDelegate{
    
    private lazy var shareView: ShareProfileView = {
        let share = ShareProfileView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        share.alpha = 0
        self.view.addSubview(share)
        return share
    }()
    
    
          /* Views */
    
//        @IBOutlet weak var avatarImage: UIImageView!
//        @IBOutlet weak var usernameLabel: UILabel!
    
        
    
        
//        override func viewWillAppear(animated: Bool) {
//            if FIRAuth.currentUser() != nil {
//                // Show User's details
//                usernameLabel.text = FIRAuth.currentUser()!.username!
//                
//                // Get image
//                avatarImage.image = UIImage(named: "logo")
//                let imageFile = PFUser.currentUser()![USER_AVATAR] as? PFFile
//                imageFile?.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
//                    if error == nil {
//                        if let imageData = imageData {
//                            self.avatarImage.image = UIImage(data:imageData)
//                        }}})
//                avatarImage.layer.cornerRadius = avatarImage.bounds.size.width/2
//            }
//            
//        }
//        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
//
//        
//        
//        // MARK: - EDIT PROFILE BUTTON
//        @IBAction func editProfileButt(sender: AnyObject) {
//            let myVC = storyboard?.instantiateViewControllerWithIdentifier("EditProfile") as! EditProfile
//            navigationController?.pushViewController(myVC, animated: true)
//        }
//        
//        
//        
//        // MARK: - ACTIVITY BUTTON
//        @IBAction func activityButt(sender: AnyObject) {
//            let myVC = storyboard?.instantiateViewControllerWithIdentifier("ActivityVC") as! ActivityVC
//            navigationController?.pushViewController(myVC, animated: true)
//        }
//        
//        
//        
//        // MARK: - LOGOUT BUTTON
//        @IBAction func logoutButt(sender: AnyObject) {
//            
//            let alert = UIAlertController(title: APP_NAME,
//                                          message: "Are you sure you want to logout?",
//                                          preferredStyle: .Alert)
//            let ok = UIAlertAction(title: "Logout", style: .Default, handler: { (action) -> Void in
//                self.showHUD()
//                
//                PFUser.logOutInBackgroundWithBlock { (error) -> Void in
//                    if error == nil {
//                        // Show the Login screen
//                        let loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("Login") as! Login
//                        self.presentViewController(loginVC, animated: true, completion: nil)
//                    }
//                    self.hideHUD()
//                }
//            })
//            
//            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in })
//            
//            alert.addAction(ok); alert.addAction(cancel)
//            presentViewController(alert, animated: true, completion: nil)
//        }
//        
//        
//        override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//        }
    
    
    // Mark: Outlet

    
//    @IBOutlet weak var profileCollectionView: UICollectionView!

    @IBOutlet var ProfileTableViewController: UITableView!
    
    @IBOutlet var SettingBtn: UIBarButtonItem!
    // Mark: Action
    @IBAction func Settings(sender: AnyObject) {
        let actionSheetController = UIAlertController(title: "Please Select", message: "Option to Select", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            print("Cancel")
            
        }
        actionSheetController.addAction(cancelActionButton)
        
        let profileActionButton = UIAlertAction(title: "Profile", style: .Default ,handler:  { (action) in
            let storyboard = UIStoryboard(name: "EditProfile", bundle: NSBundle.mainBundle())
            let vc = storyboard.instantiateInitialViewController() as! EditProfileViewController
//            let ProfileVC = self.storyboard?.instantiateInitialViewController("EditProfile") as!
            self.navigationController?.pushViewController(vc, animated: true)
            print("Edit Profile")
            
        })
        
        actionSheetController.addAction(profileActionButton)

        let logoutAction = UIAlertAction(title: "Log Out", style: .Default, handler:  { (action) in
            print("Log Out")
            self.logoutDidTapped()
        })
        
        actionSheetController.addAction(logoutAction)

        
       self.presentViewController(actionSheetController, animated: true, completion: nil)
        }

    func logoutDidTapped() {
        DataaService.ds.logout()
            }
    
        }


extension ProfileViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if shareView.progress >= 1.0 {
            shareView.shareActionAnimationAndDoFurther({
                dispatch_async(dispatch_get_main_queue()) { [weak self] in
                    self
                }
            })
        }
        
    }
}