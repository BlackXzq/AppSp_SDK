//
//  AppSpNotice.swift
//  AppSpSDK
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

class AppSpNotice: NSObject {
    
    /**
        {
          "repCode": "0000",
          "repMsg": "成功",
          "repData": [{
            "name": "这是一个公告",
            "title": "公告标题",
            "details": "1411415",
            "templateType": "dialog",
            "templateTypeName": "弹框",
            "startTime": 1597075200000,
            "endTime": 1603296000000
          }],
          "success": true,
          "error": false
        }
        */
    static func getNotice(success: @escaping (_ response: [String : Any]) -> (),
                         failure: @escaping ((_ errorInfo: [String: Any]) -> ())) {
        AppSpRequest.share.request(path: AppSpNoticePath,
                                   success: success,
                                   failure: failure)
    }
   
    class func formateResultData(_ respone: [String: Any], _ status: Bool) -> [String: Any] {
        var result = [String: Any]()
        //请求成功
        if status {
            let code = respone["repCode"]
            result["code"] = code ?? ""
            if let repData = respone["repData"] as? Array<Any> {
                 result["resultData"] = repData
            }
        } else {
            let code = respone["errorCode"]
            let message = respone["errorMsg"]
            result["code"] = code ?? ""
            result["errorMsg"] = message ?? ""
        }
        return result
    }
}
