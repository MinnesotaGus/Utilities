//
//  TimeFormatter.swift
//  
//
//  Created by Jordan Gustafson on 6/14/20.
//

import Foundation

public struct TimeFormatter {
    
    public static func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        if hours > 0 {
            return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        } else if minutes > 0 {
            return String(format:"%02i:%02i", minutes, seconds)
        } else {
            return String(format:"%02i", seconds)
        }
    }
    
}

