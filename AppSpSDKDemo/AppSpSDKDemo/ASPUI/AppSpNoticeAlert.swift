//
//  AppSpNoticeAlert.swift
//  AppSpSDKDemo
//
//  Created by Black on 2020/9/10.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

class AppSpNoticeAlert: AppSpAlert {
    
    private var _size = CGSize(width: 285, height: 200)
    
    func showNoticeAlert(title: String,
                         content: String,
                         confirmHandler: @escaping ((_ alert: AppSpAlert)->())) {
        self.title = title
        self.content = content
        self.confirmHandler = confirmHandler
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
        //标题
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 20, width: _size.width-40, height: 20))
        titleLabel.text = self.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        bgView.addSubview(titleLabel)
        //内容
        let contentTextView = UITextView()
        contentTextView.text = self.content
        contentTextView.frame = CGRect(x: 20, y: titleLabel.frame.maxY+10, width: _size.width-40, height: 90)
        contentTextView.font = UIFont.systemFont(ofSize: 15)
        contentTextView.backgroundColor = UIColor.white
        contentTextView.textColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 58/255.0, alpha: 1.0)
        contentTextView.textAlignment = .left
        contentTextView.isEditable = false
        bgView.addSubview(contentTextView)
        //确认点击button
        let btnColor = UIColor(red: 95/255.0, green: 144/255.0, blue: 232/255.0, alpha: 1.0)
        let button = UIButton()
        button.addTarget(self, action: #selector(confirmClick), for: .touchUpInside)
        button.frame = CGRect(x: (_size.width - 120)*0.5, y: contentTextView.frame.maxY + 10, width: 120, height: 40)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = btnColor
        button.setTitle("我知道了", for: .normal)
        bgView.addSubview(button)
    
        self.show()
        
    }
    
    @objc func confirmClick() {
        if confirmHandler != nil {
            confirmHandler!(self)
        }
        self.dismiss()
    }

}
