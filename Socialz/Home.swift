////
////  Home.swift
////  Brave
////
////  Created by Rami debbas on 2016-06-03.
////  Copyright © 2016 DebbasPlus. All rights reserved.
////
//
//
//import UIKit
//import GoogleMobileAds
//import AudioToolbox
//
//
//class Home: UIViewController,
//UIWebViewDelegate,
//GADBannerViewDelegate
//{
//
//    /* Views */
//    @IBOutlet weak var webView: UIWebView!
//    @IBOutlet weak var noSocialLabel: UILabel!
//    @IBOutlet weak var toolbar: UIToolbar!
//    
//    // AdMob Banner View
//    let adMobBannerView = GADBannerView()
//    
//        
//    
// 
//    
//    
//    
//override func viewDidLoad() {
//        super.viewDidLoad()
//
//    print("SELECTED SOCIAL: \(selectedSocial)")
//    
//    
//    // WebView setup
//    webView.scrollView.bounces = false
//
//    // Initialize a BACK BarButton Item
//    let butt = UIButton(type: UIButtonType.Custom)
//    butt.adjustsImageWhenHighlighted = false
//    butt.frame = CGRectMake(0, 0, 44, 44)
//    butt.setBackgroundImage(UIImage(named: "backButt"), forState: .Normal)
//    butt.addTarget(self, action: #selector(backButt), forControlEvents: .TouchUpInside)
//    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: butt)
//
//    
//    
//    // NO SELECTED SOCIAL
//    if selectedSocial == "" {
//        self.title = "Socialz"
//        noSocialLabel.hidden = false
//        
//        
//    // LOAD THE SELECTED SOCIAL
//    } else {
//        showHUD()
//        noSocialLabel.hidden = true
//        hudView.backgroundColor = selectedColor
//        
//        let url = NSURL(string: selectedSocial)
//        webView.loadRequest(NSURLRequest(URL: url!))
//        
//        self.title = selectedName
//        navigationController?.navigationBar.barTintColor = selectedColor
//        toolbar.barTintColor = selectedColor
//    }
//
//    
//    
//    // Init ad banners
//    initAdMobBanner()
//}
//
//
//// MARK: - WEBVIEW DELEGATE TO GET THE ARTICLE'S TITLE
//func webViewDidFinishLoad(webView: UIWebView) {
//    hideHUD()
//}
//    
// 
//    
//    
//   
//// MARK: - TOOLBAR BUTTONS
//@IBAction func toolbarButtons(sender: AnyObject) {
//    let butt = sender as! UIBarButtonItem
//        
//    switch butt.tag {
//        // Go back
//        case 0: webView.goBack()
//            
//        // Go next
//        case 1: webView.goForward()
//        
//        // Open to Safari
//        case 2:
//        let safariURL = NSURL(string: webView.request!.URL!.absoluteString)
//        UIApplication.sharedApplication().openURL(safariURL!)
//        
//        // Refresh page
//        case 3: webView.reload()
//            
//    default:break }
//}
//   
//    
// 
//    
//// MARK: - BACK BUTTON
//func backButt() {
//    navigationController?.popViewControllerAnimated(true)
//}
//    
// 
//    
//    
//    
//    
//// MARK: - AdMob BANNERS
//func initAdMobBanner() {
//        adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSizeMake(320, 50))
//        adMobBannerView.frame = CGRectMake(0, view.frame.size.height, 320, 50)
//        adMobBannerView.adUnitID = ADMOB_BANNER_UNIT_ID
//        adMobBannerView.rootViewController = self
//        adMobBannerView.delegate = self
//        view.addSubview(adMobBannerView)
//        
//        let request = GADRequest()
//        adMobBannerView.loadRequest(request)
//}
//    
//// Hide the banner
//func hideBanner(banner: UIView) {
//        UIView.beginAnimations("hideBanner", context: nil)
//        banner.frame = CGRectMake(view.frame.size.width/2 - banner.frame.size.width/2, view.frame.size.height - banner.frame.size.height, banner.frame.size.width, banner.frame.size.height)
//        UIView.commitAnimations()
//        banner.hidden = true
//}
//    
//// Show the banner
//func showBanner(banner: UIView) {
//        UIView.beginAnimations("showBanner", context: nil)
//        banner.frame = CGRectMake(view.frame.size.width/2 - banner.frame.size.width/2, view.frame.size.height - banner.frame.size.height - 44, banner.frame.size.width, banner.frame.size.height)
//        UIView.commitAnimations()
//        banner.hidden = false
//}
//    
//// AdMob banner available
//func adViewDidReceiveAd(view: GADBannerView!) {
//        showBanner(adMobBannerView)
//}
//    
//// NO AdMob banner available
//func adView(view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
//        hideBanner(adMobBannerView)
//}
//    
//
//    
//    
//    
//    
//override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}
//
