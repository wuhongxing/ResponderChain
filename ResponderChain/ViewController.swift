//
//  ViewController.swift
//  ResponderChain
//
//  Created by wuhongxing on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 100, width: 200, height: 40)
        button.setTitle("研究响应链", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x: 20, y: 160, width: 200, height: 40)
        button1.setTitle("研究响应链和手势", for: .normal)
        button1.tag = 2
        button1.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
        view.addSubview(button1)
    }
    
    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 1: // 响应链
            present(ResponseChainViewController())
        case 2: // 响应链 + 手势
            present(ResponseChainWithGestureViewController())
        default:
            break
        }
    }
    
    private func present(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
}

