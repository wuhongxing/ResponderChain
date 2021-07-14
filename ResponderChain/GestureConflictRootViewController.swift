//
//  GestureConflictRootViewController.swift
//  ResponderChain
//
//  Created by wuhongxing on 2021/7/13.
//

import UIKit

class GestureConflictRootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(GestureConflictViewController(), animated: true)
    }
}
