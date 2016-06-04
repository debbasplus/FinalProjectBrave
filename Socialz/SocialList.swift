//
//  SocialCell.swift
//  Brave
//
//  Created by Rami debbas on 2016-06-03.
//  Copyright © 2016 DebbasPlus. All rights reserved.
//

import UIKit


// MARK: - CUSTOM SOCIAL CELL
class SocialCell:UICollectionViewCell {
    
    /* Views */
    @IBOutlet weak var socialIcon: UIImageView!
    @IBOutlet weak var socialLabel: UILabel!
}





class SocialList: UIViewController,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
{

    /* Views */
    @IBOutlet weak var socialCollView: UICollectionView!
    
    
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    
}


    
// MARK: - COLLECTION VIEW DELEGATES 
func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
}
    
func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return socials.count //socialNames.count
}
    
func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SocialCell", forIndexPath: indexPath) as! SocialCell
    
    cell.socialLabel.text = "\(socials[indexPath.row]["name"]!)"
    cell.socialIcon.image = UIImage(named: "\(socials[indexPath.row]["name"]!)")
    
return cell
}
    
func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(view.frame.size.width/3.8, view.frame.size.width/3.8)
}
    
func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    selectedSocial = "\(socials[indexPath.row]["link"]!)"
    selectedName = "\(socials[indexPath.row]["name"]!)"
    selectedColor = socialColors[indexPath.row]
    
    let myVC = storyboard?.instantiateViewControllerWithIdentifier("Home") as! Home
    navigationController?.pushViewController(myVC, animated: true)
    // navigationController?.popViewControllerAnimated(true)
}
    

    
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
