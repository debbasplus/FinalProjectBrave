//
//  ContactsViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-19.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit

class ContactsViewController: BaseViewController , UITableViewDelegate{
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // contactsTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        contactsTableView.tableFooterView = UIView(frame: CGRectZero)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    
    //Mark Outlet
    @IBOutlet weak var contactsTableView: UITableView! {
        didSet {
            searchBar.sizeToFit()
            contactsTableView.tableHeaderView = searchBar
            contactsTableView.backgroundColor = UIColor.whiteColor()
            contactsTableView.tableFooterView = UIView()
            contactsTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    
    
    
    @IBOutlet private weak var coverUnderStatusBarView: UIView!

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .Minimal
        searchBar.placeholder = NSLocalizedString("Search Friend", comment: "")
        searchBar.setSearchFieldBackgroundImage(UIImage(named: "searchbar_textfield_background"), forState: .Normal)
        return searchBar
    }()
    
    
    private var searchController: UISearchController?
    private var searchControllerIsActive: Bool {
        return searchController?.active ?? false
    }
    
}
