//
//  ViewController.swift
//  JingMY_Swift
//
//  Created by jing_mac on 2019/6/13.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var name: String = ""{
        willSet{
            
        }
        didSet{
            
        }
    }
    
    lazy var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutItesm()
    }
    func layoutItesm(){
        tableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaInsets.top)
            maker.left.right.bottom.equalToSuperview()
        }
    }

}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        if indexPath.row == 1 {
            cell.nameLabel.text = "斐林试剂福利时间来开发建设领导看风景时离开教室里看风景时空裂缝建设路口就分手了会计分录分手快乐福建省肯定就发了"
            cell.nameLabel.numberOfLines = 0
//            cell?.textLabel?.text = "斐林试剂福利时间来开发建设领导看风景时离开教室里看风景时空裂缝建设路口就分手了会计分录分手快乐福建省肯定就发了"
//            cell?.textLabel?.numberOfLines = 0
//            cell?.detailTextLabel?.text = "斐林试剂福利时间来开发建设领导看风景时离开教室里看风景时空裂缝建设路口就分手了会计分录分手快乐福建省肯定就发了"
        }
        cell.contentView.backgroundColor = UIColor.orange
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
}

