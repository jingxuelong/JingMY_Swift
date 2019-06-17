//
//  ViewController.swift
//  SwiftLayout
//
//  Created by jing_mac on 2019/6/13.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //        layOutItems()
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
        //        centerlabel.snp.removeConstraints()
        UIView.animate(withDuration: 1) {
            self.centerlabel.snp.updateConstraints { (maker) in
                //                maker.size.equalTo(CGSize(width: self.wide/3.0, height: 400))
                //                maker.center.equalTo(CGPoint(x: self.wide/2.0, y: 400))
                maker.width.lessThanOrEqualTo(100)
            }
            
        }
    }
    
}

