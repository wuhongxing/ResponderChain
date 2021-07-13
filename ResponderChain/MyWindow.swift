//
//  MyWindow.swift
//  ResponderChain
//
//  Created by wuhongxing on 2021/7/9.
//

import UIKit

class MyWindow: UIWindow, Tagable {
    var classTag: String {
        return "MyWindow"
    }
    override func sendEvent(_ event: UIEvent) {
        // 找到第一响应者，调用第一响应者的 touchesbegan 方法
        super.sendEvent(event)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(classTag, #function)
//    }
}
