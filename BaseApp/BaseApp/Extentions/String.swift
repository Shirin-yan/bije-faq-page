//
//  String.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import Foundation

extension String {

    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        guard let date = self.getDate() else { return "error"}
        return formatter.localizedString(for: date, relativeTo: Date())
    }

    private func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone?
        dateFormatter.locale = Locale(identifier: "en_us_posix")
        let date = dateFormatter.date(from: self)
        return date
    }
}
