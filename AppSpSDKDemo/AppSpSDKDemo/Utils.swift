//
//  Utils.swift
//  AppSpSDKDemo
//
//  Created by Black on 2020/9/11.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

/// 延时主线程执行
func delay(_ seconds: Double = 2, closure: @escaping () -> ()) {
    let _t = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * seconds)) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: _t, execute: closure)
}
