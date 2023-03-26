//
//  IconBtn.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import UIKit
import EasyPeasy

class IconBtn: UIButton {
    
    var clickCallback: ( () -> Void )?

    init(iconName: String) {
        super.init(frame: .zero)
        addTarget(self, action: #selector(click), for: .touchUpInside)
        setImage(UIImage(systemName: iconName), for: .normal)
        imageView?.tintColor = .gray
        
        easy.layout(Size(40))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func click() {
        clickCallback?()
    }
}
