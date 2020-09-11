//
//  AppSpVersionAlert.swift
//  AppSpSDKDemo
//
//  Created by Black on 2020/9/10.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

class AppSpVersionAlert: AppSpAlert {
    private var _size = CGSize(width: 285, height: 200)
    //强制更新
    func showMustUpdateAlert(content: String,
                             confirmHandler: @escaping ((_ alert: AppSpAlert)->())) {
        showAction(isMustUpdate: true,
                   title: "哇，发现新版本了！",
                   content: content,
                   confirmTitle: "马上更新",
                   cancelTitle: "",
                   confirmHandler: confirmHandler,
                   cancelHandler: nil)
    }
    //非强制更新
    func showUpdateAlert(content: String,
                         confirmHandler: @escaping ((_ alert: AppSpAlert)->()),
                         cancelHandler: @escaping ((_ alert: AppSpAlert)->())) {
        showAction(isMustUpdate: false,
                   title: "哇，发现新版本了！",
                   content: content,
                   confirmTitle: "更新",
                   cancelTitle: "取消",
                   confirmHandler: confirmHandler,
                   cancelHandler: cancelHandler)
    }
    //基础弹窗
    private func showAction(isMustUpdate: Bool = false,
                        title: String? = nil,
                        content: String? = nil,
                        confirmTitle: String = "是",
                        cancelTitle: String = "否",
                        confirmHandler: ((_ alert: AppSpAlert)->())? = nil,
                        cancelHandler: ((_ alert: AppSpAlert)->())? = nil) {
        self.title = title ?? ""
        self.content = content ?? ""
        self.confirmTitle = confirmTitle
        self.cancelTitle = cancelTitle
        self.confirmHandler = confirmHandler
        self.cancelHandler = cancelHandler
        setCommonUI()
    }
    
    private func setCommonUI() {
        //背景图
        let bgView = UIView()
        bgView.frame.size = _size
        bgView.center = self.center
        bgView.backgroundColor = UIColor.white
        bgView.layer.cornerRadius = 16
        bgView.layer.masksToBounds = true
        self.addSubview(bgView)
        //顶部视图
        let headImgV = UIImageView()// 200 100
        headImgV.image = UIImage(named: "version")
        headImgV.contentMode = .scaleToFill
        let headImgVWidth: CGFloat = 240
        let headImgVHeight: CGFloat = 120
        let headX = (ASP_SCREENW - headImgVWidth)*0.5
        let headY = (bgView.frame.origin.y - 50)
        headImgV.frame = CGRect(x: headX, y: headY, width: headImgVWidth, height: headImgVHeight)
        self.addSubview(headImgV)
        
        //设置title 设置content
        self.setContentView(bgView)
        
        //底部更新视图
        let btnView = UIView()
        let btnColor = UIColor(red: 95/255.0, green: 144/255.0, blue: 232/255.0, alpha: 1.0)
        btnView.backgroundColor = btnColor
        let btnViewWidth: CGFloat = 180
        let btnViewHeight: CGFloat = 46
        btnView.layer.cornerRadius = btnViewHeight*0.5
        btnView.layer.masksToBounds = true
        let btnViewX = (ASP_SCREENW - btnViewWidth)*0.5
        let btnViewY = bgView.frame.maxY - btnViewHeight*0.5
        btnView.frame = CGRect(x: btnViewX, y: btnViewY, width: btnViewWidth, height: btnViewHeight)
        if confirmTitle.count > 0 && cancelTitle.count > 0 {
            let cancelFrame = CGRect(x: 0, y: 0, width: btnViewWidth*0.5, height: btnViewHeight)
            let confirmFrame = CGRect(x: btnViewWidth*0.5, y: 0, width: btnViewWidth*0.5, height: btnViewHeight)
            
            let cancelBtn = creatBtn(frame: cancelFrame, title: cancelTitle)
            let confirmBtn = creatBtn(frame: confirmFrame, title: confirmTitle)
            cancelBtn.addTarget(self, action: #selector(cancelClick), for: .touchUpInside)
            confirmBtn.addTarget(self, action: #selector(confirmClick), for: .touchUpInside)
            
            btnView.addSubview(cancelBtn)
            btnView.addSubview(confirmBtn)
        } else {
            let button = creatBtn(frame: btnView.bounds, title: confirmTitle)
            button.addTarget(self, action: #selector(confirmClick), for: .touchUpInside)
            btnView.addSubview(button)
        }
        self.addSubview(btnView)
        
        show()
    }
    // 内容填充
    private func setContentView(_ bgV: UIView) {
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 70, width: _size.width-40, height: 20))
        titleLabel.text = self.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        bgV.addSubview(titleLabel)
        
        let contentTextView = UITextView()
        contentTextView.text = self.content
        contentTextView.frame = CGRect(x: 20, y: 90, width: _size.width-40, height: 80)
        contentTextView.font = UIFont.systemFont(ofSize: 15)
        contentTextView.backgroundColor = UIColor.white
        contentTextView.textColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 58/255.0, alpha: 1.0)
        contentTextView.textAlignment = .left
        contentTextView.isEditable = false
        bgV.addSubview(contentTextView)
    }
    
    //创建通用button
    private func creatBtn(frame: CGRect, title: String) -> UIButton {
        let button = UIButton()
        button.frame = frame
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle(title, for: .normal)
        return button
    }
    
    @objc func confirmClick() {
        if self.confirmHandler != nil {
            self.confirmHandler!(self)
        }
        self.dismiss()
    }
    
    @objc func cancelClick() {
        if self.cancelHandler != nil {
            self.cancelHandler!(self)
        }
        self.dismiss()
    }
    

}
