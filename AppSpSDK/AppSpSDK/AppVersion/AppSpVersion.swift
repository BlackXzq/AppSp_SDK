//
//  AppSpVersion.swift
//  AppSpSDK
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

class AppSpVersion: NSObject {
    class func checkVersionUpdate(_ finished: @escaping (_ response: [String : Any]) -> ()) {
        AppSpRequest.share.request(path: AppSpAppVersionPath, success: { (repData) in
            finished(repData)
        }) { (errorData) in
            finished(errorData)
        }
    }
}
