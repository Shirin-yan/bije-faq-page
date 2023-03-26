//
//  IconTextBtn.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import UIKit
import EasyPeasy

class IconTextBtn: UIStackView {

    let icon = UIImageView()
    
    let title = UILabel(font: .systemFont(ofSize: 16),
                        color: .secondaryLabel,
                        alignment: .center,
                        numOfLines: 1,
                        text: "bije")
    
    init(title: String, iconName: String, withBorder: Bool = false) {
        super.init(frame: .zero)
        setupView()
        
        icon.tintColor = .gray
        icon.image = UIImage(systemName: iconName)
        self.title.text = title

        addBackground(color: .clear,
                      cornerRadius: 12,
                      borderWidth: 1,
                      borderColor: withBorder ? .tertiaryLabel : .clear)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        spacing = 6
        addArrangedSubviews([icon,
                             title])
        
        icon.easy.layout(Size(16))
        addMargins(insets: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    }
}
