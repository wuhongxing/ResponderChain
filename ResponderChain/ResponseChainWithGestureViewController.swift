//
//  ResponseChainWithGestureViewController.swift
//  ResponderChain
//
//  Created by wuhongxing on 2021/7/13.
//

import UIKit


class ResponseChainWithGestureViewController: UIViewController, Tagable {
    var classTag: String = "ResponseChain"
    
    
    override func loadView() {
        let aView = AView(frame: UIScreen.main.bounds)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(aViewDidTaped))
        aView.addGestureRecognizer(tapGesture)
        aView.backgroundColor = .gray
        self.view = aView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bView = BView(frame: CGRect(x: 100, y: 140, width: 200, height: 350))
        bView.backgroundColor = .brown
        let tapGesture = CustomTapGesture(target: self, action: #selector(bViewDidTaped))
        tapGesture.addObserver(self, forKeyPath: "state", options: [.old, .new], context: nil)
        bView.addGestureRecognizer(tapGesture)
        view.addSubview(bView)
        
        let kControl = KControl(frame: CGRect(x: 20, y: 20, width: 120, height: 50))
        kControl.backgroundColor = .purple
        kControl.addTarget(self, action: #selector(kControlDidTouchUpInside), for: .touchUpInside)
        bView.addSubview(kControl)
        
        let iButton = IButton(frame: CGRect(x: 20, y: 100, width: 120, height: 50))
        iButton.backgroundColor = .purple
        iButton.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        iButton.addTarget(nil, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        bView.addSubview(iButton)
        
        let fControl = HControl(frame: CGRect(x: 20, y: 170, width: 120, height: 50))
        fControl.backgroundColor = .purple
        fControl.addTarget(self, action: #selector(controlDidTouchUpInside), for: .touchUpInside)
        bView.addSubview(fControl)
        
        let gScrollView = GScrollView(frame: CGRect(x: 20, y: 240, width: 120, height: 50))
        gScrollView.backgroundColor = .black
        bView.addSubview(gScrollView)
        
        let cView = CView(frame: CGRect(x: 20, y: 310, width: 120, height: 50))
        cView.backgroundColor = .red
        bView.addSubview(cView)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        case possible = 0
//        case began = 1
//        case changed = 2
//        case ended = 3
//        case cancelled = 4
//        case failed = 5
        print(change?[NSKeyValueChangeKey.newKey], change?[NSKeyValueChangeKey.oldKey])
    }
    
    @objc private func controlDidTouchUpInside() {
        print("controlDidTouchUpInside")
    }
    
    @objc private func controlDidTaped() {
        print("controlDidTaped")
    }
    
    @objc private func bViewDidTaped() {
        print("bViewDidTaped")
    }
    
    @objc private func aViewDidTaped() {
        print("aViewDidTaped")
    }
    
    @objc private func buttonDidTouchUpInside() {
        print("buttonDidTouchUpInside")
    }
    
    @objc private func kControlDidTouchUpInside() {
        print("kControlDidTouchUpInside")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
        super.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
        super.touchesCancelled(touches, with: event)
    }
}

class CustomTapGesture: UITapGestureRecognizer, Tagable {
    var classTag: String {
        return "CustomTapGesture"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        print(classTag, #function, state.rawValue)
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        print(classTag, #function, state.rawValue)
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        print(classTag, #function, state.rawValue)
        // 如果这里不执行父类的 touchesEnded 方法，则会调用父视图的 tapped 方法
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        print(classTag, #function, state.rawValue)
        super.touchesCancelled(touches, with: event)
    }
}
