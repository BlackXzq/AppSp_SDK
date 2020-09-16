//
//  AppSpService.swift
//  AppSpSDK
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit
// test appKey: 64cf5a851f37c6c0ab7a3186a2377d5d

public class AppSpService: NSObject {
    @objc public static let shareService = AppSpService()
    fileprivate var _appKey: String?
    
    //初始化使用服务
    @objc public func setAppkey(appKey: String) {
        _appKey = appKey
        deviceInit()
    }
    
    //获取appkey 用于请求接口
    func getAppKey() -> String {
        return _appKey ?? ""
    }
    //获取版本更新接口
    @objc public func checkVersionUpdate(success: @escaping (_ response: [String : Any]) -> (),
                                   failure: @escaping ((_ errorInfo: [String: Any]) -> ())) {
        AppSpVersion.checkVersionUpdate(success: success, failure: failure)
    }
    //获取公告信息接口
    @objc public func getNoticeInfo(success: @escaping (_ response: [String : Any]) -> (),
                              failure: @escaping ((_ errorInfo: [String: Any]) -> ())) {
        AppSpNotice.getNotice(success: success, failure: failure)
    }
    //初始化设备信息
    private func deviceInit() {
        AppSpDeviceInfo.deviceInit()
    }
    
}


