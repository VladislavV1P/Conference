//
//  FormattingUtils.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//

import Foundation

class FormattingUtils {
    
    private enum Constants {
        static let dateFormat = "dd.MM"
        static let timeFormat = "HH:mm"
    }
    
    static func formatDate(date: Date) -> String {
        let format = date.getFormattedDate(format: Constants.dateFormat)
        return format
    }
    
    static func formatTime(date: Date) -> String {
        let format = date.getFormattedDate(format: Constants.timeFormat)
        return format
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .none
       dateFormatter.dateFormat = format
       return dateFormatter.string(from: self)
    }
}
