//
//  FeedsViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-19.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var feedsTableView: UITableView!  {
        didSet {
            
            feedsTableView.backgroundColor = UIColor.whiteColor()
            feedsTableView.tableFooterView = UIView()
            feedsTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            
        }
        
}
    
        
        var data = [
            
            ads(adsImage: "allen", sharedName: "Allen Wang", actionType: "Read Later", adsTitle: "Giphy Cam Lets You Create And Share Homemade Gifs", adsCoverImage: "giphy", adsSouce: "TheNextWeb", adsTime: "5min  •  13:20"),
            ads(adsImage: "Daniel Hooper", sharedName: "Daniel Hooper", actionType: "Shared on Twitter", adsTitle: "Principle. The Sketch of Prototyping Tools", adsCoverImage: "my workflow flow", adsSouce: "SketchTalk", adsTime: "3min  •  12:57"),
            ads(adsImage: "davidbeckham", sharedName: "David Beckham", actionType: "Shared on Facebook", adsTitle: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC", adsCoverImage: "Ohlala", adsSouce: "TechCrunch", adsTime: "1min  •  12:59"),
            ads(adsImage: "bruce", sharedName: "Bruce Fan", actionType: "Shared on Weibo", adsTitle: "Lonely Planet’s new mobile app helps you explore major cities like a pro", adsCoverImage: "Lonely Planet", adsSouce: "36Kr", adsTime: "5min  •  11:21"),
            
            ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            feedsTableView.dataSource = self
            feedsTableView.delegate = self
            feedsTableView.separatorStyle = UITableViewCellSeparatorStyle.None
            feedsTableView.tableFooterView = UIView(frame: CGRectZero)
            
        }
        
        override func preferredStatusBarStyle() -> UIStatusBarStyle {
            return UIStatusBarStyle.LightContent
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func viewWillAppear(animated: Bool) {
            
            animateTable()
            
        }
        
        func animateTable() {
            
            self.feedsTableView.reloadData()
            
            let cells = feedsTableView.visibleCells
            let tableHeight: CGFloat = feedsTableView.bounds.size.height
            
            for i in cells {
                let cell: UITableViewCell = i as UITableViewCell
                cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
            }
            
            var index = 0
            
            for a in cells {
                let cell: UITableViewCell = a as UITableViewCell
                UIView.animateWithDuration(1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                    cell.transform = CGAffineTransformMakeTranslation(0, 0);
                    }, completion: nil)
                
                index += 1
            }
    }
    
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 10
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 165
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = feedsTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! adsTableViewCell
            
            let ads = data[indexPath.row]
            
            cell.adsImage.image = UIImage(named: ads.adsImage)
            cell.adsCoverImage.image = UIImage(named: ads.adsCoverImage)
            cell.sharedNameLabel.text = ads.sharedName
            cell.actionTypeLabel.text = ads.actionType
            cell.adsTitleLabel.text = ads.adsTitle
            cell.adsSouceLabel.text = ads.adsSouce
            cell.adsCreatedAtLabel.text = ads.adsTime
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            return cell
            
    }
    
}
