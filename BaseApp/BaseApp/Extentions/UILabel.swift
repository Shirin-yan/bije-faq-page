//
//  UILabel.swift
//  Meninki
//
//  Created by NyanDeveloper on 08.12.2022.
//

import UIKit.UILabel

extension UILabel {
    convenience init(font: UIFont?,
                     color: UIColor = .label,
                     alignment: NSTextAlignment = .left,
                     numOfLines: Int = 0,
                     text: String = "" ) {
        
        self.init(frame: .zero)
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = numOfLines
        self.text = text
    }
}
