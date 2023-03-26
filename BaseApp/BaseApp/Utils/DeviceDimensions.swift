//
//  DeviceDimensions.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit

class DeviceDimensions {
    
    static let width = UIScreen.main.bounds.size.width
    
    static let height = UIScreen.main.bounds.size.height

    static let safeAreaHeight = height - topInset - bottomInset
    
    static let keyWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first

    static let topInset = keyWindow?.safeAreaInsets.top ?? 0
    
    static let bottomInset = keyWindow?.safeAreaInsets.bottom ?? 0

}
