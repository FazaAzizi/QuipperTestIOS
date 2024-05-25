//
//  Int+Extension.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation

extension Int {
    func convertSecondsToTimeString() -> String {
        let time = self / 1000
        let minutes = time / 60
        let remainingSeconds = time % 60
        
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
