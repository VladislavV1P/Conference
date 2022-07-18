//
//  FormattingUtils.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//

import Foundation

class FormattingUtils {
    
    private enum Constants {
        static let dateFormatToDisplay = "dd.MM"
        static let timeFormat = "HH:mm"
    }
    
    static func formatDate(date: Date) -> String {
        let format = date.getFormattedDate(format: Constants.dateFormatToDisplay)
        return format
    }
    
    static func formatTime(date: Date) -> String {
        let format = date.getFormattedDate(format: Constants.timeFormat)
        return format
    }
    
    static var dateFormatter = DateFormatter()
    
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

extension DateFormatter {
    var formatForConvertStringToDate: DateFormatter {
        self.locale = Locale(identifier: "en_US_POSIX")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return self
    }
}
