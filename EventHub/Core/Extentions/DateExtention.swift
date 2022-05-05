//
//  DateExtention.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import Foundation


extension Date {
    func formateDate(formatTemplate: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate(formatTemplate)
        return dateFormatter.string(from: self)
    }
}
