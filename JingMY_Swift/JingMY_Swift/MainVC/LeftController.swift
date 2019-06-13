//
//  LeftController.swift
//  JingMY_Swift
//
//  Created by jing_mac on 2019/6/13.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit
import SnapKit

class LeftController: BaseController {

    lazy var topView:UIView = UIView()
    lazy var leftView:UIView = UIView()
    lazy var rightView:UIView = UIView()
    lazy var bottomView:UIView = UIView()
    lazy var centerlabel:UILabel = UILabel()
    
    let wide = UIScreen.main.bounds.size.width
    var countLayOut = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setItems()
        layOutItems()
        
        
        
    }
    
    
    func layOutItems() {
        print(countLayOut)
        centerlabel.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.lessThanOrEqualTo(wide/2.0)
        }
        topView.snp.makeConstraints({ (maker) in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalTo(centerlabel.snp_top)
        })
        
        leftView.snp.makeConstraints({ (maker) in
            maker.top.equalTo(topView.snp_bottom)
            maker.left.equalToSuperview()
            maker.right.equalTo(centerlabel.snp_left)
            maker.bottom.equalTo(bottomView.snp_top)
        })
        rightView.snp.makeConstraints({ (maker) in
            maker.top.equalTo(topView.snp_bottom)
            maker.left.equalTo(centerlabel.snp_right)
            maker.right.equalToSuperview()
            maker.bottom.equalTo(bottomView.snp_top)
        })
        bottomView.snp.makeConstraints({ (maker) in
            maker.bottom.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalTo(centerlabel.snp_bottom)
        })
        
    }
    
    func setItems() {
        topView.backgroundColor = UIColor.orange
        view.addSubview(topView)
        
        leftView.backgroundColor = UIColor.lightGray
        view.addSubview(leftView)
        
        rightView.backgroundColor = UIColor.yellow
        view.addSubview(rightView)
        
        bottomView.backgroundColor = UIColor.blue
        view.addSubview(bottomView)
        
        centerlabel.backgroundColor = UIColor.white
        view.addSubview(centerlabel)
        let gesTap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        centerlabel.text = "slfklsdfjlffdfdsfdslfklsdfjlffdfdsfdsslfklsdfjlffdfdsfdsslfklsdfjlffdfdsfdsslfklsdfjlffdfdsfdss"
        centerlabel.numberOfLines = 0
        centerlabel.isUserInteractionEnabled = true
        centerlabel.addGestureRecognizer(gesTap)
        
        
    }
    
    @objc func tap(_ sender:Any){
        present(TestTimerController(), animated: true, completion: nil)
        
        /**
        self.centerlabel.snp.updateConstraints { (maker) in
            maker.width.lessThanOrEqualTo(100)
        }*/
    }
    
}

