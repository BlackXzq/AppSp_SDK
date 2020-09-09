//
//  AppSpDeviceInfo.swift
//  AppSpSDK
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

class AppSpDeviceInfo: NSObject {
    class func deviceInit() {
        AppSpRequest.share.request(path: AppSpDeviceInitPath, success: { (repData) in
            appSpLog(repData)
        }) { (errorData) in
            appSpLog(errorData)
        }
    }
    //直接返回接口请求的基础参数字典
    class func getDeviceInfo() -> [String: String] {
        return  [
           "brand": "vivo X9",
           "deviceId": "96e174417db3bd0bf4:b7:b3:df:04:c5",
           "netWorkStatus": "WIFI",
           "osVersion": "7.1.2",
           "platform": "Android",
           "screenInfo": "1920*1080",
           "versionCode": "1",
           "versionName": "1.0"
         ]
    }
}
