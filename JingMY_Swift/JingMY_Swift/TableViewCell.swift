//
//  TableViewCell.swift
//  JingMY_Swift
//
//  Created by 荆学龙 on 2019/8/5.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
            maker.height.greaterThanOrEqualTo(30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
