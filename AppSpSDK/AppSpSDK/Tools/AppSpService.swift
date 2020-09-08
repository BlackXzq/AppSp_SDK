//
//  AppSpService.swift
//  AppSpSDK
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

// 基础请求路径
let AppSpBaseURL = "http://10.108.26.127:8081"
// 获取公告
let AppSpNoticePath = "/sp/phone/appNotice"
// 获取版本更新
let AppSpAppVersionPath = "/sp/phone/appVersion"
// 设备初始化
let AppSpDeviceInitPath = "/sp/phone/deviceInit"

public class AppSpService: NSObject {
    public static let shareService = AppSpService()
    var _appKey: String?
    var _apiSession: URLSession!
    //初始化请求session
    override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Accept": "application/json"]
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 60
        _apiSession = URLSession(configuration: configuration)
    }
    
    public func setAppkey(appKey: String) {
        _appKey = "64cf5a851f37c6c0ab7a3186a2377d5d"
//        _appKey = appKey
        let params:[String: Any] = ["appKey": "afhasfhjkahs",
                                    "device": "iphone6s",
                                    "build": 2,
                                    "data": [
                                        "userName": "xzq",
                                        "phone": "13761238312"
                                    ],
                                    "list":["LS1", "LS2"]]
        self.formateRequestBody(parmas: params)
    }
    
    func request(path: String,
                 options: [String: Any]? = nil,
                 success: @escaping (_ response: [String : Any]?) -> (),
                 failure: @escaping ((String) -> ())) {
        
        let reqUrlStr = AppSpBaseURL + path
        guard let reqUrl = URL(string: reqUrlStr) else { return failure("非法URL") }
        var request = URLRequest(url: reqUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var baseParams = AppSpDeviceInfo.getDeviceInfo()
        baseParams["appKey"] = _appKey
        #warning("字典追加内容")
        let params: [String: Any] = [
            "data": baseParams,
            "sign": "XPbmWoR00ks0"
        ]
        request.httpBody = self.formateRequestBody(parmas: params)
        
    }
    
    
}
extension AppSpService {
    func formateRequestBody(parmas: [String: Any]?) -> Data? {
        var formateReqStr = ""
        if let options = parmas {
            formateReqStr = options.compactMap({ (key, value) -> String? in
                return "\(key)=\(value)"
//                if value is [String: Any] || value is [Any] {
//                    var jsonString = NSString()
//                    let jsonData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
//                    if (jsonData != nil) {
//                        jsonString = NSString(data: jsonData!, encoding: String.Encoding.utf8.rawValue)!
//                    }
//                    print(jsonString)
//                    return "\(key)=\(jsonString)"
//                } else {
//                    return "\(key)=\(value)"
//                }
            }).joined(separator: "&")
        }
        print(formateReqStr)
        return formateReqStr.data(using: String.Encoding.utf8)
    }
}
