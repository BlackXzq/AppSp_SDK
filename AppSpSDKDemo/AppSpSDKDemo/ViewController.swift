//
//  ViewController.swift
//  AppSpSDKDemo
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit
import AppSpSDK
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppSpService.shareService.setAppkey(appKey: "kkkkkkkk")
    }


}

