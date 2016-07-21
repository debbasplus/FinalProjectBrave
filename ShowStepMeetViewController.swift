//
//  ShowStepMeetViewController.swift
//  Brave
//
//  Created by Rami debbas on 2016-07-15.
//  Copyright © 2016 Debbasplus. All rights reserved.
//

import UIKit


final class ShowStepMeetViewController: ShowStepViewController {
    // for images

//
//    @IBOutlet private weak var yellowTriangle: UIImageView!
//    @IBOutlet private weak var greenTriangle: UIImageView!
//    @IBOutlet private weak var purpleTriangle: UIImageView!
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = NSLocalizedString("Meet", comment: "")
        subTitleLabel.text = NSLocalizedString("Build world together", comment: "")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // for images
        
//        animate(yellowTriangle, offset: 3, duration: 3)
//        animate(greenTriangle, offset: 7, duration: 2)
//        animate(purpleTriangle, offset: 5, duration: 2)
    }
}
