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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bViewDidTaped))
        bView.addGestureRecognizer(tapGesture)
        view.addSubview(bView)
        
        let iButton = IButton(frame: CGRect(x: 20, y: 100, width: 120, height: 50))
        iButton.backgroundColor = .purple
        iButton.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        bView.addSubview(iButton)
        
        let fControl = HControl(frame: CGRect(x: 20, y: 170, width: 120, height: 50))
        fControl.backgroundColor = .purple
        fControl.addTarget(self, action: #selector(controlDidTouchUpInside), for: .touchUpInside)
        bView.addSubview(fControl)
        
        let gScrollView = GScrollView(frame: CGRect(x: 20, y: 240, width: 120, height: 50))
        gScrollView.backgroundColor = .black
        bView.addSubview(gScrollView)
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
