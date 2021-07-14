//
//  GestureConflictViewController.swift
//  ResponderChain
//
//  Created by wuhongxing on 2021/7/13.
//

import UIKit

class GestureConflictViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let testView = UIView(frame: CGRect(x: 20, y: 100, width: 300, height: 50))
        testView.backgroundColor = .red
        view.addSubview(testView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(testViewDidTaped))
        testView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(testViewDidDoubleTaped))
        doubleTap.numberOfTapsRequired = 2
        testView.addGestureRecognizer(doubleTap)
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 160, width: 500, height: 50))
        scrollView.contentSize = CGSize(width: 1000, height: 0)
        scrollView.backgroundColor = .yellow
        scrollView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
//        scrollView.panGestureRecognizer.delegate = self
        view.addSubview(scrollView)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let contentOffset = change?[NSKeyValueChangeKey.newKey] as? CGPoint else { return }
        navigationController?.interactivePopGestureRecognizer?.isEnabled = contentOffset.x <= 0
    }
    
    @objc private func testViewDidTaped() {
        print("testViewDidTaped")
    }
    
    @objc private func testViewDidDoubleTaped() {
        print("testViewDidDoubleTaped")
    }
}

extension GestureConflictViewController: UIGestureRecognizerDelegate {
    
}
