//
//  Utilities.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 09/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import Foundation
import UIKit

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation: "GMT-3:00")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}

extension Date {
    var toString: String {        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: self)
    }
}

extension UIViewController {
    public var isVisible: Bool {
        if isViewLoaded {
            return view.window != nil
        }
        return false
    }
}

