//
//  TestTimerController.swift
//  JingMY_Swift
//
//  Created by jing_mac on 2019/6/13.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit

var timer: Timer?
var count: Int = 0

class TestTimerController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] (timer) in
            self?.timerAction()
        })
        
    }
    
    @objc func timerAction() {
        for _ in 1...15 {
            count+=1
            print(count)
            DownLoadManager.sharedInstance.addDownLoadImage(path: "\(count)")
        }

    }
    
    deinit {
        print(#function)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}

