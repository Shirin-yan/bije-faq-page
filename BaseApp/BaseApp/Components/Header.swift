//
//  Header.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import UIKit

class Header: UIStackView {

    let leadingBtn = IconBtn(iconName: "bookmark")
    
    let title = UILabel(font: .systemFont(ofSize: 16),
                        color: .red,
                        alignment: .center,
                        numOfLines: 1,
                        text: "bije")
    
    let trailingBtn = IconBtn(iconName: "text.bubble")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addArrangedSubviews([leadingBtn,
                             title,
                             trailingBtn])
        
        addMargins(insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
}
