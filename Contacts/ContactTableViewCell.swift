//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Dmitry Maslennikov on 07/05/2022.
//  Copyright © 2022 Dmitry Maslennikov. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    let fullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView() {
        contentView.addSubview(fullName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fullName.centerYAnchor.constraint(equalTo: centerYAnchor),
            fullName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
