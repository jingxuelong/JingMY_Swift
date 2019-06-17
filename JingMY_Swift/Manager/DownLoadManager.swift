//
//  DownLoadManager.swift
//  JingMY_Swift
//
//  Created by jing_mac on 2019/6/13.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit

class DownLoadManager: NSObject {
    
    static let sharedInstance = DownLoadManager()
    var name: String = "abc"
    let opQueue = OperationQueue()
    let finishThread = Thread{
        print("RunLoop start")
        RunLoop.current.add(Port(), forMode: RunLoop.Mode.default)
        RunLoop.current.run()
        print("RunLoop dead")
    }
    
    override init() {
        super.init()
        opQueue.maxConcurrentOperationCount = 3
        finishThread.name = "FinishThread"
        finishThread.start()
    }
    func addDownLoadImage( path: String) {
        opQueue.addOperation {[weak self] in
            let threadName = Thread.current.name ?? "nil"
            print(Thread.current)
            self?.perform(#selector(self?.finish(name:)), on: self!.finishThread, with: path, waitUntilDone: false, modes: [RunLoop.Mode.default.rawValue,RunLoop.Mode.tracking.rawValue])
        }
        
    }
    @objc func finish( name: String) {
        let threadName = Thread.current.name ?? "nil"
        print(name+threadName)
    }
}
