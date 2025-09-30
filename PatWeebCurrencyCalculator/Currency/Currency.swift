//
//  Currency.swift
//  PatWeebCurrencyCalculator
//
//  Created by Patrick Moscova on 9/27/25.
//

import Foundation
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case yen = 0.006688
    case wan = 0.000709
    case dollar = 1.0
    case berry = 7.0
    
    var id: Currency { self }
    
    
    var image: ImageResource {
        switch self {
            case .yen:
                return .yen
            case .wan:
                return .wan
            case .dollar:
                return .dollar
            case .berry:
                return .berry
        }
    }
    
    var name: String {
        switch self {
            case .yen:
                "Yen"
            case .wan:
                "Wan (₩)"
            case .dollar:
                "US Dollar"
            case .berry:
                "Berry"
        }
    }
    
    func format(_ value: Double) -> String {
        switch self {
            case .yen:
                return "¥" + String(format: "%.0f", value)
            case .wan:
                return "₩" + String(format: "%.0f", value)
            case .dollar:
                return "$" + String(format: "%.2f", value)
            case .berry:
                return "฿" + String(format: "%.2f", value)
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        let usdValue = doubleAmount * self.rawValue
        
        let targetValue = usdValue / currency.rawValue
        
        return currency.format(targetValue)
    }
    
}
