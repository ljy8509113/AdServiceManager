//
//  ViewController.swift
//  AdServiceManager
//
//  Created by ljy8509113@nate.com on 11/30/2022.
//  Copyright (c) 2022 ljy8509113@nate.com. All rights reserved.
//

import UIKit
import AdServiceManager
import Combine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AdManager.shared.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onButton(_ sender: Any) {
        AdManager.shared.openOfferwall(viewContrller: self)
    }
}

