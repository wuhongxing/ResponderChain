//
//  ResponseChainViewController.swift
//  ResponderChain
//
//  Created by wuhongxing on 2021/7/12.
//

import UIKit

class ResponseChainViewController: UIViewController, Tagable {
    var classTag: String = "ResponseChain"
    
    
    override func loadView() {
        let aView = AView(frame: UIScreen.main.bounds)
        aView.backgroundColor = .gray
        self.view = aView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bView = BView(frame: CGRect(x: 20, y: 20, width: 200, height: 150))
        bView.backgroundColor = .blue
        view.addSubview(bView)
        
        let cView = CView(frame: CGRect(x: 20, y: 20, width: 120, height: 50))
        cView.backgroundColor = .red
        bView.addSubview(cView)
        
        let dView = DView(frame: CGRect(x: 100, y: 140, width: 200, height: 350))
        dView.backgroundColor = .brown
        view.addSubview(dView)

        let eView = EView(frame: CGRect(x: 20, y: 40, width: 120, height: 50))
        eView.backgroundColor = .orange
        dView.addSubview(eView)

        let fView = FView(frame: CGRect(x: -50, y: 100, width: 170, height: 50))
        fView.backgroundColor = .cyan
        dView.addSubview(fView)
        
        let fControl = HControl(frame: CGRect(x: 20, y: 170, width: 120, height: 50))
        fControl.backgroundColor = .purple
        dView.addSubview(fControl)
        
        let gScrollView = GScrollView(frame: CGRect(x: 20, y: 240, width: 120, height: 50))
        gScrollView.backgroundColor = .black
        dView.addSubview(gScrollView)
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

protocol Tagable {
    var classTag: String { get }
}

extension Tagable where Self: UIView {
    func addTagLabel() {
        let labelView = UILabel(frame: CGRect(x: frame.width - 110, y: 10, width: 100, height: 20))
        labelView.text = classTag
        labelView.textColor = .white
        labelView.textAlignment = .right
        
        addSubview(labelView)
    }
}

class AbstractView: UIView, Tagable {
    var classTag: String {
        fatalError("不可以直接使用抽象类")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTagLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print(classTag, #function, self.point(inside: point, with: event))
        if isHidden || !isUserInteractionEnabled || alpha <= 0.01 {
            return nil
        }
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                let resultView = subview.hitTest(convertedPoint, with: event)
                if let resultView = resultView {
                    return resultView
                }
            }
            return self
        }
        return super.hitTest(point, with: event)
    }
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let isInside = super.point(inside: point, with: event)
//        return isInside
//    }
}

class AView: AbstractView {
    override var classTag: String {
        return "A"
    }
}

class BView: AbstractView {
    override var classTag: String {
        return "B"
    }
}

class CView: AbstractView {
    override var classTag: String {
        return "C"
    }
}

class DView: AbstractView {
    override var classTag: String {
        return "D"
    }
}

class EView: AbstractView {
    override var classTag: String {
        return "E"
    }
}

class FView: AbstractView {
    override var classTag: String {
        return "F"
    }
}

class KControl: HControl {
    override var classTag: String {
        return "KControl"
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizerShouldBegin")
        return false
    }
}

class HControl: UIControl, Tagable {
    var classTag: String {
        return "HControl"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTagLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
//        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
        
//        self.next?.touchesMoved(touches, with: event)
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
//        self.next?.touchesEnded(touches, with: event)
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
//        self.next?.touchesCancelled(touches, with: event)
        super.touchesCancelled(touches, with: event)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print(classTag, #function, self.point(inside: point, with: event))
        if isHidden || !isUserInteractionEnabled || alpha <= 0.01 {
            return nil
        }
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                let resultView = subview.hitTest(convertedPoint, with: event)
                if let resultView = resultView {
                    return resultView
                }
            }
            return self
        }
        return super.hitTest(point, with: event)
    }
}

class IButton: UIButton, Tagable {
    var classTag: String {
        return "IButton"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTagLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
//        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
        
//        self.next?.touchesMoved(touches, with: event)
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
//        self.next?.touchesEnded(touches, with: event)
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(classTag, #function)
//        self.next?.touchesCancelled(touches, with: event)
        super.touchesCancelled(touches, with: event)
    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        print(classTag, #function, self.point(inside: point, with: event))
//        if isHidden || !isUserInteractionEnabled || alpha <= 0.01 {
//            return nil
//        }
//        if self.point(inside: point, with: event) {
//            for subview in subviews.reversed() {
//                let convertedPoint = subview.convert(point, from: self)
//                let resultView = subview.hitTest(convertedPoint, with: event)
//                if let resultView = resultView {
//                    return resultView
//                }
//            }
//            return self
//        }
//        return super.hitTest(point, with: event)
//    }
}


class GScrollView: UIScrollView, Tagable {
    var classTag: String {
        return "GScrollView"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTagLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print(classTag, #function, self.point(inside: point, with: event))
        if isHidden || !isUserInteractionEnabled || alpha <= 0.01 {
            return nil
        }
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                let resultView = subview.hitTest(convertedPoint, with: event)
                if let resultView = resultView {
                    return resultView
                }
            }
            return self
        }
        return super.hitTest(point, with: event)
    }
}
