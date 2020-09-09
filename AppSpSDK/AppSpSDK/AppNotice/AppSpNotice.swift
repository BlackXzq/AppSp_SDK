//
//  AppSpNotice.swift
//  AppSpSDK
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

class AppSpNotice: NSObject {
    class func getNotice(_ finished: @escaping (_ response: [String : Any]) -> ()) {
        AppSpRequest.share.request(path: AppSpNoticePath, success: { (repData) in
            finished(repData)
        }) { (errorData) in
            finished(errorData)
        }
    }
}
