//
//  Date+Ext.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 15/1/21.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredAndTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -120, to: Date())!
    }
}
