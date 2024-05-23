//
//  Int+Extension.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation

extension Int {
    func convertSecondsToTimeString() -> String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let remainingSeconds = self % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, remainingSeconds)
    }
}
