//
//  String.swift
//  TopEvent
//
//  Created by Владислав Патраков on 13.07.2022.
//

import Foundation

extension String {
    func stringToDateConverter(dateFormatter: DateFormatter) -> Date {
        let date = dateFormatter.formatForConvertStringToDate.date(from:self) ?? Date()
        return date
    }
}
