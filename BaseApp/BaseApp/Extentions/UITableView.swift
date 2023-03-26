//
//  UITableView.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit.UITableView

extension UITableView {
    convenience init( style: Style = .plain,
                      rowHeight: CGFloat,
                      estimatedRowHeight: CGFloat = 100,
                      backgroundColor: UIColor = .clear) {
        self.init(frame: .zero, style: style)
        self.estimatedRowHeight = estimatedRowHeight
        self.rowHeight = rowHeight
        self.backgroundColor = backgroundColor
        contentInset.bottom = 10
        separatorStyle = .none
        keyboardDismissMode = .onDrag
        showsVerticalScrollIndicator = false
        
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        }
    }
}
