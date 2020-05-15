//
//  SnackTableViewCell.swift
//  Snacks
//
//  Created by 桑染 on 2020-05-14.
//  Copyright © 2020 Rick. All rights reserved.
//

import UIKit

class SnackTableViewCell: UITableViewCell {

    let snacksLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(snacksLabel)
        NSLayoutConstraint.activate([
            snacksLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            snacksLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            snacksLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            snacksLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
