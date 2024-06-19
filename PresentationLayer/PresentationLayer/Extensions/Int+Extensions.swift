//
//  Int+Extensions.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

extension Int {
    func toTimeString() -> String {
        var timeString = "\(self)s"
        if abs(self) > 60 {
            timeString = "\(self / 60)m"
        }
        return timeString
    }
}
