//
//  ViewController.swift
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
import FirebaseDatabase

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UIPageViewControllerDelegate {
    
    //Mark : Outlet


    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var isFirstAppear = true
    
    private var steps = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if user != nil {
                // user is signed in.
                //move the user to the home screen
               
                let storyboard : UIStoryboard = UIStoryboard (name: "Home", bundle: nil)
                let tabHome :UIViewController = storyboard.instantiateViewControllerWithIdentifier("TabHome")
                
                self.presentViewController(tabHome, animated: true, completion: nil)

            } else {
                // no user is signed in.
                // show the user the log
                
            }
        }
//        // dissmiss Keyboard
//        
//        let dissmissKeyboard = UITapGestureRecognizer(target: self, action: #Selector(LoginViewController.dissmissKeyboard(_:)))
//        dissmissKeyboard.numberOfTapRequired = 1
//        view.addGestureRecognizer(dissmissKeyboard)
//        
        makeUI()

    }
    
//    func dissmissKeyboard(tap: UITapGestureRecognizer){
//        view.endEditing(true)
//    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//       FBSDKAccessToken.currentAccessToken() != nil)

        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if isFirstAppear {
            scrollView.alpha = 0
            pageControl.alpha = 0

        //If the user is already logged in take them straight to the next screen
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier("loggedIn", sender: nil)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if isFirstAppear {
        
            UIView.animateWithDuration(1, delay: 0.5, options: .CurveEaseInOut, animations: { [weak self] in
                self?.scrollView.alpha = 1
                self?.pageControl.alpha = 1
                }, completion: { _ in })
        }
        
        isFirstAppear = false
    }
    
    private func makeUI() {
        
        let stepA = stepDescover()
        let stepB = stepMatch()
        let stepC = stepMeet()
        
        steps = [stepA, stepB, stepC]
        
      pageControl.numberOfPages = steps.count
    
    let viewsDictionary: [String: AnyObject] = [
        "view": view,
        "stepA": stepA.view,
        "stepB": stepB.view,
        "stepC": stepC.view,
        ]
    
    let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[stepA(==view)]|", options: [], metrics: nil, views: viewsDictionary)
    
    NSLayoutConstraint.activateConstraints(vConstraints)
    
    let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[stepA(==view)][stepB(==view)][stepC(==view)]|", options: [.AlignAllBottom, .AlignAllTop], metrics: nil, views: viewsDictionary)
    
    NSLayoutConstraint.activateConstraints(hConstraints)
    }

private func stepDescover() -> ShowStepDescoverViewController {
    let step = storyboard!.instantiateViewControllerWithIdentifier("ShowStepDescoveriewController") as! ShowStepDescoverViewController
    
    step.view.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(step.view)
    
    addChildViewController(step)
    step.didMoveToParentViewController(self)
    
    return step
}

private func stepMatch() -> ShowStepMatchViewController {
    let step = storyboard!.instantiateViewControllerWithIdentifier("ShowStepMatchViewController") as! ShowStepMatchViewController
    
    step.view.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(step.view)
    
    addChildViewController(step)
    step.didMoveToParentViewController(self)
    
    return step
}

private func stepMeet() -> ShowStepMeetViewController {
    let step = storyboard!.instantiateViewControllerWithIdentifier("ShowStepMeetViewController") as! ShowStepMeetViewController
    
    step.view.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(step.view)
    
    addChildViewController(step)
    step.didMoveToParentViewController(self)
    
    return step
    }

  



    //Mark : Action

    
    @IBAction func registerButton(sender:AnyObject){
        FIRAuth.auth()?.createUserWithEmail(emailField.text!,password:passwordField.text!, completion: { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
            }else {
                print("user Created...")
            }
            })
    }


    
    @IBAction func loginDidTApped(sender: UIButton!) {
        guard let email = emailField.text where !email.isEmpty, let password = passwordField.text where !password.isEmpty else {
            ProgressHUD.showError("Email and Paswword can't be empty")
            return
        }
        ProgressHUD.show("Siging in..")
         DataaService.ds.login(email, paswword: password)
        
    }
//
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let controller = storyboard.instantiateViewControllerWithIdentifier("TabHome") as UIViewController
//        
//        self.presentViewController(controller, animated: true, completion: nil)
//    }
    
//
//        //Make sure there is an email and a password
//        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
//            
//            DataService.ds.Root_Ref.authUser(email, password: pwd) { error, authData in
//                
//                if error != nil {
//            print(error.code)
//                    
//                    if error.code == STATUS_ACCOUNT_NOEXIST {
//                
//                        DataService.ds.REF_BASE.createUser(email, password: pwd,
//                                        withValueCompletionBlock: { error, result in
//        if error != nil {
//            self.showErrorAlert("Could not create account", msg: "Problem creating account. Try something else")
//            } else {
//        let uid = result["uid"] as? String
//            NSUserDefaults.standardUserDefaults().setValue(uid, forKey: KEY_UID)
//                                    
//            DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
//                                        
//            //Store what type of account this is
//        let user = ["provider": authData.provider!]
//                DataService.ds.createFirebaseUser(uid!, user: user)
//                                        
//                })
//            self.performSegueWithIdentifier("loggedIn", sender: nil)
//                        }
//                })
//            }  else {
//            
//            self.showErrorAlert("Error loggin in", msg: "Could not log in. Check your username and password") }
//            
//                } else {
//                    self.performSegueWithIdentifier("loggedIn", sender: nil)
//                        }
//            }
//            } else {
//            showErrorAlert("Email & Password Required", msg: "You must enter an email address and a password")
//        }
//    }
//
//    func showErrorAlert(title: String, msg: String) {
//        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
//        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
//        alert.addAction(action)
//        presentViewController(alert, animated: true, completion: nil)
//    }
    
    // FB login btn
    
    @IBAction func fbBtnPressed(sender: FBSDKLoginButton!) {
        
        
        let facebookLogin: FBSDKLoginManager = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: self) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
        
        if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
        } else {
            
        let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            print("Succesfully logged in with facebook.\(accessToken)")
            
            
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
            FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in

        if error != nil {
                        print("Login failed. \(error)")
        } else {
                        print("Logged In! \(user)")

            //Store what type of account this is
        let userData = ["provider": credential.provider]
            DataaService.ds.createFirebaseUser(user!.uid, user: userData)
            
            NSUserDefaults.standardUserDefaults().setValue(user!.uid, forKey: KEY_UID)
       
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    }
            })
        
            }
        }
    }
   
}

extension LoginViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        let page = Int(round(pageFraction))
        
        pageControl.currentPage = page
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
