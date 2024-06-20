//
//  Int+Extensions.swift
//  PresentationLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

extension Int {
    func toTimeString() -> String {
        let timePoint = 5
        var timeString = "\(self)s"
        // if the time is larger than 5 minutes
        if abs(self) > 60 * timePoint {
            timeString = "\(self / 60 + (self / abs(self)))m"
        } else if abs(self) == 60 * timePoint {
            timeString = "\(self / abs(self) * timePoint)m"
        } else if abs(self) > 60 { // the time is less than 5 minutes but larger 1 minute
            let minutes = Int(self / 60)
            let seconds = Int(abs(self) % 60)
            timeString = "\(minutes)m \(seconds)s"
        }
        return timeString
    }
}
